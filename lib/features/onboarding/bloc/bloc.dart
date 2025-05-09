import 'package:equatable/equatable.dart';
import 'package:fitted/features/onboarding/data/enums/female_measurement_enum.dart';
import 'package:fitted/features/onboarding/data/enums/unit_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/female_measurement_model.dart';
import '../data/models/measurement_model.dart';

part 'event.dart';
part "state.dart";

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc()
      : super(OnboardingState(
          measurements: FemaleMeasurementModel(
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
      final updatedMeasurements = state.measurements.updateMeasurement(
        event.field,
        event.value,
      );
      emit(state.copyWith(measurements: updatedMeasurements));
    });

    on<SelectFit>(_selectFit);
    on<SelectStyle>(_selectStyle);
    on<IncrementIndex>(_incrementIndex);
  }

  _selectStyle(SelectStyle event, Emitter<OnboardingState> emit) {
    add(IncrementIndex());
    emit(state.copyWith(style: event.style));
  }

  _selectFit(SelectFit event, Emitter<OnboardingState> emit) {
    add(IncrementIndex());
    emit(state.copyWith(style: event.fit));
  }

  _incrementIndex(IncrementIndex event, Emitter<OnboardingState> emit) {
    int incrementedIndex = state.currentIndex;
    incrementedIndex++;
    emit(
      state.copyWith(
        currentIndex: incrementedIndex,
      ),
    );
  }
}
