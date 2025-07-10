import 'package:fitted/core/di/service_locator.dart';
import 'package:fitted/features/home/presentation/bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class HomeProvider {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<HomeBloc>(
        create: (context) => sl<HomeBloc>(),
      ),
    ];
  }
}
