import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/enums/female_measurement_enum.dart';
import '../../data/enums/male_measurement_enum.dart';
import '../../data/enums/unit_enum.dart';
import '../../data/models/female_measurement_model.dart';
import '../../data/models/male_measurement_model.dart';
import '../../data/models/measurement_model.dart';
import '../../data/models/measurement_request_model.dart';
import '../../domain/usecase/measurement_usecase.dart';

part "event.dart";
part 'state.dart';

class MeasurementBloc extends Bloc<MeasurementEvent, MeasurementState> {
  final AddMeasurementUseCase onboardUserUseCase;

  MeasurementBloc({required this.onboardUserUseCase})
      : super(MeasurementState(
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
            lowerWaist: Measurement(value: 0, unit: Unit.cm),
            thighCircumference: Measurement(value: 0, unit: Unit.cm),
          ),
          femaleMeasurementModel: FemaleMeasurementModel(
            bust: Measurement(value: 0, unit: Unit.cm),
            bandSize: Measurement(value: 0, unit: Unit.cm),
            cupSize: Measurement(value: 0, unit: Unit.cm),
            sleevesLength: Measurement(value: 0, unit: Unit.cm),
            waist: Measurement(value: 0, unit: Unit.cm),
            torsoHeight: Measurement(value: 0, unit: Unit.cm),
            lowerWaist: Measurement(value: 0, unit: Unit.cm),
            hip: Measurement(value: 0, unit: Unit.cm),
            inseam: Measurement(value: 0, unit: Unit.cm),
            legLength: Measurement(value: 0, unit: Unit.cm),
            height: Measurement(value: 0, unit: Unit.cm),
          ),
          style: "",
          fit: "",
          currentIndex: 0,
        )) {
    on<UpdateMeasurement>((event, emit) {
      if (state.style == "male") {
        _updateMaleMeasurement(
            event.field as MaleMeasurementEnum, event.value, emit);
      } else {
        _updateFemaleMeasurement(
            event.field as FemaleMeasurementEnum, event.value, emit);
      }
    });

    on<SelectFit>(_selectFit);
    on<SelectStyle>(_selectStyle);
    on<IncrementIndex>(_incrementIndex);
    on<OnboardUser>((event, emit) async {
      final result = await onboardUserUseCase(
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
                  bust: null,
                  bandSize: null,
                  cupSize: null,
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
                  waist: state.maleMeasurementModel.lowerWaist,
                  hip: state.maleMeasurementModel.hip,
                  inseam: state.maleMeasurementModel.inseam,
                  legLength: state.maleMeasurementModel.legLength,
                  thighCircumference:
                      state.maleMeasurementModel.thighCircumference,
                )
              : LowerBodyMeasurement(
                  waist: state.femaleMeasurementModel.lowerWaist,
                  hip: state.femaleMeasurementModel.hip,
                  inseam: state.femaleMeasurementModel.inseam,
                  legLength: state.femaleMeasurementModel.legLength,
                ),
        ),
      );

      result.fold(
        (failure) {
          emit(state.copyWith());
        },
        (successData) {},
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
