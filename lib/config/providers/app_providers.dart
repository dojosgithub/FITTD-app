import 'package:fitted/config/providers/auth/auth_providers.dart';
import 'package:fitted/config/providers/settings/settings_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'measurement/measurement_provider.dart';

class AppProviders {
  static List<BlocProvider> getProviders() {
    return [
      ...AuthProviders.getProviders(),
      ...MeasurementProvider.getProviders(),
      ...SettingsProvider.getProviders(),
    ];
  }
}
