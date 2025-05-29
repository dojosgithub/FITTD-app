import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/features/apparel/domain/usecases/apparel_usecase.dart';
import '../../domain/entities/apparel_entity.dart';
import '../../domain/entities/category_products_entity.dart';
part "event.dart";
part "state.dart";

class ApparelBloc extends Bloc<ApparelEvent, ApparelState> {
  final ApparelUseCase apparelUsecase;
  final GetCategoryProductsUseCase getCategoryProductsUseCase;

  ApparelBloc(
      {required this.apparelUsecase, required this.getCategoryProductsUseCase})
      : super(const ApparelState()) {
    on<GetApparelEvent>(_onGetApparel);
    on<SetCategory>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        final category = event.category.toLowerCase();
        final result = await getCategoryProductsUseCase(
          category: category,
          page: 1,
        );
        result.fold(
          (failure) {
            log("Error fetching apparel: ${failure.message}");
            emit(state.copyWith(
              isLoading: false,
              error: failure.message,
            ));
          },
          (categoryProductsResponseModel) {
            emit(state.copyWith(
              isLoading: false,
              productsEntity:
                  categoryProductsResponseModel.productsByCategory[category],
            ));
          },
        );
      },
    );
  }

  Future<void> _onGetApparel(
    GetApparelEvent event,
    Emitter<ApparelState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await apparelUsecase(brand: event.brand);

    result.fold(
      (failure) {
        log("Error fetching apparel: ${failure.message}");
        emit(state.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
      (apparelResponseModel) {
        emit(state.copyWith(
          isLoading: false,
          apparelEntity: apparelResponseModel,
        ));
      },
    );
  }
}
