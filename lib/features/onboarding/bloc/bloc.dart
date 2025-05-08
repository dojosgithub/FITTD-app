import 'package:equatable/equatable.dart';
import 'package:fitted/features/onboarding/data/enums/unit_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part "state.dart";

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc()
      : super(OnboardingState(
          selectedUnit: Unit.inch,
          heightCm: 177,
          heightIn: 69,
          style: "",
          fit: "",
          currentIndex: 0,
        )) {
    on<ChangeUnit>(_changeUnit);
    on<ChangeHeight>(_changeHeight);
    on<SelectFit>(_selectFit);
    on<SelectStyle>(_selectStyle);
    on<IncrementIndex>(_incrementIndex);
  }

  _changeHeight(ChangeHeight event, Emitter<OnboardingState> emit) {
    state.selectedUnit == Unit.inch
        ? emit(state.copyWith(heightIn: event.height))
        : emit(state.copyWith(heightCm: event.height));
  }

  _changeUnit(ChangeUnit event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(selectedUnit: event.selectedUnit));
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
