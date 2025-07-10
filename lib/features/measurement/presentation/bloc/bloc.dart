import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/features/measurement/data/models/other_measurement_model.dart';
import 'package:fitted/features/measurement/domain/entities/measurement_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/enums/female_measurement_enum.dart';
import '../../data/enums/male_measurement_enum.dart';
import '../../data/enums/other_measurements_enum.dart';
import '../../data/enums/unit_enum.dart';
import '../../data/models/female_measurement_model.dart';
import '../../data/models/male_measurement_model.dart';
import '../../data/models/measurement_model.dart';
import '../../data/models/measurement_request_model.dart';
import '../../domain/usecase/measurement_usecase.dart';

part "event.dart";
part 'state.dart';

class MeasurementBloc extends Bloc<MeasurementEvent, MeasurementState> {
  final AddMeasurementUseCase addMeasurementsUseCase;
  final GetMeasurementUseCase getMeasurementsUseCase;

  MeasurementBloc({
    required this.addMeasurementsUseCase,
    required this.getMeasurementsUseCase,
  }) : super(_initialState()) {
    _registerEventHandlers();
  }
  // Initial State
  static MeasurementState _initialState() {
    return MeasurementState(
      maleMeasurementModel: MaleMeasurementModel.empty(),
      femaleMeasurementModel: FemaleMeasurementModel.empty(),
      otherMeasurementModel: OtherMeasurementModel.empty(),
      style: "",
      fit: "",
      currentIndex: 0,
      isLoading: false,
      isSuccess: false,
    );
  }

  // Register Bloc Events
  void _registerEventHandlers() {
    on<UpdateMeasurement>(_onUpdateMeasurement);
    on<UpdateOtherMeasurement>(_onUpdateOtherMeasurement);
    on<SelectFit>(_onSelectFit);
    on<SelectStyle>(_onSelectStyle);
    on<IncrementIndex>(_onIncrementIndex);
    on<AddMeasurements>(_onAddMeasurements);
    on<GetMeasurements>(_onGetMeasurements);
  }

  // Event Handlers
  void _onUpdateMeasurement(
      UpdateMeasurement event, Emitter<MeasurementState> emit) {
    if (state.style == "male") {
      final updated = state.maleMeasurementModel
          .updateMeasurement(event.field as MaleMeasurementEnum, event.value);
      emit(state.copyWith(maleMeasurementModel: updated));
    } else if (state.style == "female") {
      final updated = state.femaleMeasurementModel
          .updateMeasurement(event.field as FemaleMeasurementEnum, event.value);
      emit(state.copyWith(femaleMeasurementModel: updated));
    }
  }

  void _onUpdateOtherMeasurement(
      UpdateOtherMeasurement event, Emitter<MeasurementState> emit) {
    final updated = state.otherMeasurementModel
        .updateMeasurement(event.field as OtherMeasurementsEnum, event.value);
    emit(state.copyWith(otherMeasurementModel: updated));
  }

  void _onSelectStyle(SelectStyle event, Emitter<MeasurementState> emit) {
    emit(state.copyWith(style: event.style));
    add(IncrementIndex());
  }

  void _onSelectFit(SelectFit event, Emitter<MeasurementState> emit) {
    emit(state.copyWith(fit: event.fit));
    add(IncrementIndex());
  }

  void _onIncrementIndex(IncrementIndex event, Emitter<MeasurementState> emit) {
    emit(state.copyWith(currentIndex: state.currentIndex + 1));
  }

  Future<void> _onAddMeasurements(
      AddMeasurements event, Emitter<MeasurementState> emit) async {
    emit(state.copyWith(isLoading: true, isSuccess: false));

    final result = await addMeasurementsUseCase(
      _buildRequestModelFromState(),
    );

    result.fold(
      (failure) {
        ToastUtil.showToast(message: "Failed to Update Measurement");
        emit(state.copyWith(isLoading: false));
      },
      (data) {
        SharedPrefsStorage.setUserFit(state.fit);
        _emitMeasurementSuccess(data, emit, isSuccess: true);
      },
    );
  }

  Future<void> _onGetMeasurements(
      GetMeasurements event, Emitter<MeasurementState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await getMeasurementsUseCase();

    result.fold(
      (failure) {
        ToastUtil.showToast(message: "Failed to Get Measurement");
        emit(state.copyWith(isLoading: false));
      },
      (data) {
        _emitMeasurementSuccess(data, emit, isSuccess: false);
      },
    );
  }

  // Helpers
  MeasurementRequestModel _buildRequestModelFromState() {
    return MeasurementRequestModel(
      gender: state.style,
      fit: state.fit,
      height: _getHeight(),
      upperBody: _buildUpperBody(),
      lowerBody: _buildLowerBody(),
      footMeasurement: _buildFootMeasurement(),
      headMeasurement: _buildHeadMeasurement(),
      faceMeasurement: _buildFaceMeasurement(),
      handMeasurement: _buildHandMeasurement(),
    );
  }

// ------------------- Helper Functions -------------------

  Measurement _getHeight() {
    return state.style == "male"
        ? state.maleMeasurementModel.height
        : state.femaleMeasurementModel.height;
  }

  UpperBodyMeasurement _buildUpperBody() {
    return state.style == "male"
        ? UpperBodyMeasurement(
            chest: state.maleMeasurementModel.chest,
            shoulderWidth: state.maleMeasurementModel.shoulderWidth,
            bicep: state.maleMeasurementModel.bicep,
            sleevesLength: state.maleMeasurementModel.sleevesLength,
            torsoHeight: state.maleMeasurementModel.torsoHeight,
          )
        : UpperBodyMeasurement(
            bust: state.femaleMeasurementModel.bust,
            bandSize: state.femaleMeasurementModel.bandSize,
            cupSize: state.femaleMeasurementModel.cupSize,
            sleevesLength: state.femaleMeasurementModel.sleevesLength,
            torsoHeight: state.femaleMeasurementModel.torsoHeight,
          );
  }

  LowerBodyMeasurement _buildLowerBody() {
    return state.style == "male"
        ? LowerBodyMeasurement(
            waist: state.maleMeasurementModel.waist,
            hip: state.maleMeasurementModel.hip,
            inseam: state.maleMeasurementModel.inseam,
            thighCircumference: state.maleMeasurementModel.thighCircumference,
          )
        : LowerBodyMeasurement(
            waist: state.femaleMeasurementModel.waist,
            hip: state.femaleMeasurementModel.hip,
            inseam: state.femaleMeasurementModel.inseam,
          );
  }

  FootMeasurement _buildFootMeasurement() {
    return FootMeasurement(
      footLength: state.otherMeasurementModel.feetLength,
      footWidth: state.otherMeasurementModel.feetWidth,
    );
  }

  HeadMeasurement _buildHeadMeasurement() {
    return HeadMeasurement(
      headCircumference: state.otherMeasurementModel.head,
    );
  }

  FaceMeasurement _buildFaceMeasurement() {
    return FaceMeasurement(
      faceLength: state.otherMeasurementModel.faceLength,
      faceWidth: state.otherMeasurementModel.faceWidth,
    );
  }

  HandMeasurement _buildHandMeasurement() {
    return HandMeasurement(
      handLength: state.otherMeasurementModel.handLength,
      handWidth: state.otherMeasurementModel.handWidth,
    );
  }

  void _emitMeasurementSuccess(
    MeasurementEntity data,
    Emitter<MeasurementState> emit, {
    required bool isSuccess,
  }) {
    final male = data.gender == "male";
    final newState = state.copyWith(
      isLoading: false,
      isSuccess: isSuccess,
      style: data.gender,
      fit: data.fit,
      currentIndex: 0,
      maleMeasurementModel:
          male ? _mapToMaleModel(data) : state.maleMeasurementModel,
      femaleMeasurementModel:
          !male ? _mapToFemaleModel(data) : state.femaleMeasurementModel,
      otherMeasurementModel: _mapOtherMeasurements(data),
    );

    emit(newState);
  }

  MaleMeasurementModel _mapToMaleModel(MeasurementEntity data) {
    return MaleMeasurementModel(
      chest: safeMeasurement(data.upperBody?.chest),
      sleevesLength: safeMeasurement(data.upperBody?.sleevesLength),
      waist: safeMeasurement(data.lowerBody?.waist),
      torsoHeight: safeMeasurement(data.upperBody?.torsoHeight),
      hip: safeMeasurement(data.lowerBody?.hip),
      inseam: safeMeasurement(data.lowerBody?.inseam),
      bicep: safeMeasurement(data.upperBody?.bicep),
      shoulderWidth: safeMeasurement(data.upperBody?.shoulderWidth),
      thighCircumference: safeMeasurement(data.lowerBody?.thighCircumference),
      height: safeMeasurement(data.height),
    );
  }

  FemaleMeasurementModel _mapToFemaleModel(MeasurementEntity data) {
    return FemaleMeasurementModel(
      bust: safeMeasurement(data.upperBody?.bust),
      bandSize: safeMeasurement(data.upperBody?.bandSize),
      cupSize: safeMeasurement(data.upperBody?.cupSize),
      sleevesLength: safeMeasurement(data.upperBody?.sleevesLength),
      waist: safeMeasurement(data.lowerBody?.waist),
      torsoHeight: safeMeasurement(data.upperBody?.torsoHeight),
      hip: safeMeasurement(data.lowerBody?.hip),
      inseam: safeMeasurement(data.lowerBody?.inseam),
      height: safeMeasurement(data.height),
    );
  }

  OtherMeasurementModel _mapOtherMeasurements(MeasurementEntity data) {
    return OtherMeasurementModel(
      feetLength: safeMeasurement(data.footMeasurement?.footLength),
      feetWidth: safeMeasurement(data.footMeasurement?.footWidth),
      handLength: safeMeasurement(data.handMeasurement?.handLength),
      handWidth: safeMeasurement(data.handMeasurement?.handWidth),
      head: safeMeasurement(data.headMeasurement?.headCircumference),
      faceLength: safeMeasurement(data.faceMeasurement?.faceLength),
      faceWidth: safeMeasurement(data.faceMeasurement?.faceWidth),
    );
  }

  Measurement safeMeasurement(Measurement? m) {
    return Measurement(
      value: m?.value ?? 0,
      unit: m?.unit ?? Unit.cm,
    );
  }
}
