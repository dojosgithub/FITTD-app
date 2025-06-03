import 'package:fitted/core/di/service_locator.dart';
import 'package:fitted/features/products/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsProvider {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<ProductsBloc>(
        create: (context) => sl<ProductsBloc>(),
      ),
    ];
  }
}
