import 'package:fitted/core/di/service_locator.dart';
import 'package:fitted/features/settings/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsProvider {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<SettingsBloc>(
        create: (context) => sl<SettingsBloc>(),
      ),
    ];
  }
}
