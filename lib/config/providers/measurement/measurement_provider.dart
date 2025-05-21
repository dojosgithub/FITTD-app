import 'package:fitted/core/di/service_locator.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeasurementProvider {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<MeasurementBloc>(
        create: (context) => sl<MeasurementBloc>(),
      ),
    ];
  }
}
