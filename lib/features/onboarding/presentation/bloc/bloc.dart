import 'package:equatable/equatable.dart';
import 'package:fitted/features/onboarding/data/enums/female_measurement_enum.dart';
import 'package:fitted/features/onboarding/data/enums/unit_enum.dart';
import 'package:fitted/features/onboarding/data/models/onboarding_request_model.dart';
import 'package:fitted/features/onboarding/domain/usecase/onboarding_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/enums/male_measurement_enum.dart';
import '../../data/models/female_measurement_model.dart';
import '../../data/models/male_measurement_model.dart';
import '../../data/models/measurement_model.dart';

part 'event.dart';
part "state.dart";

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardUserUseCase onboardUserUseCase;

  OnboardingBloc({required this.onboardUserUseCase})
      : super(OnboardingState(
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
        OnboardingRequestModel(
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
                  waist: state.maleMeasurementModel.waist,
                  torsoHeight: state.maleMeasurementModel.torsoHeight,
                )
              : UpperBodyMeasurement(
                  bust: state.femaleMeasurementModel.bust,
                  bandSize: state.femaleMeasurementModel.bandSize,
                  cupSize: state.femaleMeasurementModel.cupSize,
                  sleevesLength: state.femaleMeasurementModel.sleevesLength,
                  waist: state.femaleMeasurementModel.waist,
                  torsoHeight: state.femaleMeasurementModel.torsoHeight,
                ),
          lowerBody: state.style == "male"
              ? LowerBodyMeasurement(
                  lowerWaist: state.maleMeasurementModel.lowerWaist,
                  hip: state.maleMeasurementModel.hip,
                  inseam: state.maleMeasurementModel.inseam,
                  legLength: state.maleMeasurementModel.legLength,
                  thighCircumference:
                      state.maleMeasurementModel.thighCircumference,
                )
              : LowerBodyMeasurement(
                  lowerWaist: state.femaleMeasurementModel.lowerWaist,
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

  _selectStyle(SelectStyle event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(style: event.style));
    add(IncrementIndex());
  }

  _selectFit(SelectFit event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(fit: event.fit));
    add(IncrementIndex());
  }

  _incrementIndex(IncrementIndex event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentIndex: state.currentIndex + 1));
  }

  void _updateFemaleMeasurement(FemaleMeasurementEnum field, Measurement value,
      Emitter<OnboardingState> emit) {
    final updated =
        state.femaleMeasurementModel.updateMeasurement(field, value);
    emit(state.copyWith(femaleMeasurementModel: updated));
  }

  void _updateMaleMeasurement(MaleMeasurementEnum field, Measurement value,
      Emitter<OnboardingState> emit) {
    final updated = state.maleMeasurementModel.updateMeasurement(field, value);
    emit(state.copyWith(maleMeasurementModel: updated));
  }
}
