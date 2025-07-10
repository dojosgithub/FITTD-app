import 'package:fitted/core/di/service_locator.dart';
import 'package:fitted/features/search/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProvider {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<SearchBloc>(
        create: (context) => sl<SearchBloc>(),
      ),
    ];
  }
}
