
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/features/measurement/data/models/other_measurement_model.dart';
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
  }) : super(MeasurementState(
          maleMeasurementModel: MaleMeasurementModel(
            chest: Measurement(value: 0, unit: Unit.cm),
            sleevesLength: Measurement(value: 0, unit: Unit.cm),
            waist: Measurement(value: 0, unit: Unit.cm),
            torsoHeight: Measurement(value: 0, unit: Unit.cm),
            hip: Measurement(value: 0, unit: Unit.cm),
            inseam: Measurement(value: 0, unit: Unit.cm),
            legLength: Measurement(value: 0, unit: Unit.cm),
            height: Measurement(value: 0, unit: Unit.cm),
            bicep: Measurement(value: 0, unit: Unit.cm),
            shoulderWidth: Measurement(value: 0, unit: Unit.cm),
            thighCircumference: Measurement(value: 0, unit: Unit.cm),
          ),
          femaleMeasurementModel: FemaleMeasurementModel(
            bust: Measurement(value: 0, unit: Unit.cm),
            bandSize: Measurement(value: 0, unit: Unit.cm),
            cupSize: Measurement(value: 0, unit: Unit.cm),
            sleevesLength: Measurement(value: 0, unit: Unit.cm),
            waist: Measurement(value: 0, unit: Unit.cm),
            torsoHeight: Measurement(value: 0, unit: Unit.cm),
            hip: Measurement(value: 0, unit: Unit.cm),
            inseam: Measurement(value: 0, unit: Unit.cm),
            legLength: Measurement(value: 0, unit: Unit.cm),
            height: Measurement(value: 0, unit: Unit.cm),
          ),
          otherMeasurementModel: OtherMeasurementModel(
            feetLength: Measurement(value: 0, unit: Unit.cm),
            feetWidth: Measurement(value: 0, unit: Unit.cm),
            handLength: Measurement(value: 0, unit: Unit.cm),
            handWidth: Measurement(value: 0, unit: Unit.cm),
            head: Measurement(value: 0, unit: Unit.cm),
            faceLength: Measurement(value: 0, unit: Unit.cm),
            faceWidth: Measurement(value: 0, unit: Unit.cm),
          ),
          style: "",
          fit: "",
          currentIndex: 0,
          isLoading: false,
          isSuccess: false,
        )) {
    on<UpdateMeasurement>((event, emit) {
      if (state.style == "male") {
        _updateMaleMeasurement(
            event.field as MaleMeasurementEnum, event.value, emit);
      } else if ((state.style == "female")) {
        _updateFemaleMeasurement(
            event.field as FemaleMeasurementEnum, event.value, emit);
      }
    });
    on<UpdateOtherMeasurement>((event, emit) {
      final updated = state.otherMeasurementModel
          .updateMeasurement(event.field as OtherMeasurementsEnum, event.value);
      emit(state.copyWith(otherMeasurementModel: updated));
    });

    on<SelectFit>(_selectFit);
    on<SelectStyle>(_selectStyle);
    on<IncrementIndex>(_incrementIndex);
    on<AddMeasurements>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          isSuccess: false,
        ),
      );
      final result = await addMeasurementsUseCase(
        MeasurementRequestModel(
            gender: state.style,
            fit: state.fit,
            height: state.style == "male"
                ? state.maleMeasurementModel.height
                : state.femaleMeasurementModel.height,
            upperBody: state.style == "male"
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
                  ),
            lowerBody: state.style == "male"
                ? LowerBodyMeasurement(
                    waist: state.maleMeasurementModel.waist,
                    hip: state.maleMeasurementModel.hip,
                    inseam: state.maleMeasurementModel.inseam,
                    legLength: state.maleMeasurementModel.legLength,
                    thighCircumference:
                        state.maleMeasurementModel.thighCircumference,
                  )
                : LowerBodyMeasurement(
                    waist: state.femaleMeasurementModel.waist,
                    hip: state.femaleMeasurementModel.hip,
                    inseam: state.femaleMeasurementModel.inseam,
                    legLength: state.femaleMeasurementModel.legLength,
                  ),
            footMeasurement: FootMeasurement(
              footLength: state.otherMeasurementModel.feetLength,
              footWidth: state.otherMeasurementModel.feetWidth,
            ),
            headMeasurement: HeadMeasurement(
                headCircumference: state.otherMeasurementModel.head),
            faceMeasurement: FaceMeasurement(
              faceLength: state.otherMeasurementModel.faceLength,
              faceWidth: state.otherMeasurementModel.faceWidth,
            ),
            handMeasurement: HandMeasurement(
              handLength: state.otherMeasurementModel.handLength,
              handWidth: state.otherMeasurementModel.handWidth,
            )),
      );
      result.fold(
        (failure) {
          ToastUtil.showToast(message: "Failed to Update Measurement");
          emit(
            state.copyWith(
              isLoading: false,
            ),
          );
        },
        (successData) {
          SharedPrefsStorage.setUserFit(state.fit);
          emit(
            state.copyWith(
              isSuccess: true,
              isLoading: false,
              currentIndex: 0,
            ),
          );
        },
      );
    });

    on<GetMeasurements>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final result = await getMeasurementsUseCase();
      result.fold(
        (failure) {
          ToastUtil.showToast(message: "Failed to Get Measurement");
          emit(
            state.copyWith(
              isLoading: false,
            ),
          );
        },
        (successData) {
          if (successData.gender == "male") {
            final maleMeasurement = MaleMeasurementModel(
              chest: safeMeasurement(successData.upperBody!.chest),
              sleevesLength:
                  safeMeasurement(successData.upperBody!.sleevesLength),
              waist: safeMeasurement(successData.lowerBody!.waist),
              torsoHeight: safeMeasurement(successData.upperBody!.torsoHeight),
              hip: safeMeasurement(successData.lowerBody!.hip),
              inseam: safeMeasurement(successData.lowerBody!.inseam),
              legLength: safeMeasurement(successData.lowerBody!.legLength),
              bicep: safeMeasurement(successData.upperBody!.bicep),
              shoulderWidth:
                  safeMeasurement(successData.upperBody!.shoulderWidth),
              thighCircumference:
                  safeMeasurement(successData.lowerBody!.thighCircumference),
              height: safeMeasurement(successData.height),
            );
            emit(
              state.copyWith(
                isLoading: false,
                style: successData.gender,
                fit: successData.fit,
                maleMeasurementModel: maleMeasurement,
                otherMeasurementModel: OtherMeasurementModel(
                  feetLength:
                      safeMeasurement(successData.footMeasurement?.footLength),
                  feetWidth:
                      safeMeasurement(successData.footMeasurement?.footWidth),
                  handLength:
                      safeMeasurement(successData.handMeasurement?.handLength),
                  handWidth:
                      safeMeasurement(successData.handMeasurement?.handWidth),
                  head: safeMeasurement(
                      successData.headMeasurement?.headCircumference),
                  faceLength:
                      safeMeasurement(successData.faceMeasurement?.faceLength),
                  faceWidth:
                      safeMeasurement(successData.faceMeasurement?.faceWidth),
                ),
              ),
            );
          } else {
            final femaleMeasurement = FemaleMeasurementModel(
              bust: safeMeasurement(successData.upperBody!.bust),
              bandSize: safeMeasurement(successData.upperBody!.bandSize),
              cupSize: safeMeasurement(successData.upperBody!.cupSize),
              sleevesLength:
                  safeMeasurement(successData.upperBody!.sleevesLength),
              waist: safeMeasurement(successData.lowerBody!.waist),
              torsoHeight: safeMeasurement(successData.upperBody!.torsoHeight),
              hip: safeMeasurement(successData.lowerBody!.hip),
              inseam: safeMeasurement(successData.lowerBody!.inseam),
              legLength: safeMeasurement(successData.lowerBody!.legLength),
              height: safeMeasurement(successData.height),
            );
            emit(
              state.copyWith(
                isLoading: false,
                style: successData.gender,
                fit: successData.fit,
                femaleMeasurementModel: femaleMeasurement,
              ),
            );
          }
        },
      );
    });
  }

  _selectStyle(SelectStyle event, Emitter<MeasurementState> emit) {
    emit(state.copyWith(style: event.style));
    add(IncrementIndex());
  }

  _selectFit(SelectFit event, Emitter<MeasurementState> emit) {
    emit(state.copyWith(fit: event.fit));
    add(IncrementIndex());
  }

  _incrementIndex(IncrementIndex event, Emitter<MeasurementState> emit) {
    emit(state.copyWith(currentIndex: state.currentIndex + 1));
  }

  void _updateFemaleMeasurement(FemaleMeasurementEnum field, Measurement value,
      Emitter<MeasurementState> emit) {
    final updated =
        state.femaleMeasurementModel.updateMeasurement(field, value);
    emit(state.copyWith(femaleMeasurementModel: updated));
  }

  void _updateMaleMeasurement(MaleMeasurementEnum field, Measurement value,
      Emitter<MeasurementState> emit) {
    final updated = state.maleMeasurementModel.updateMeasurement(field, value);
    emit(state.copyWith(maleMeasurementModel: updated));
  }
}

Measurement safeMeasurement(Measurement? m) {
  final num safeValue = m?.value ?? 0;
  final Unit safeUnit = m?.unit ?? Unit.cm;
  return Measurement(value: safeValue, unit: safeUnit);
}
