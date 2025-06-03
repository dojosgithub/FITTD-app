import 'package:fitted/config/providers/apparel/apparel_providers.dart';
import 'package:fitted/config/providers/auth/auth_providers.dart';
import 'package:fitted/config/providers/settings/settings_provider.dart';
import 'package:fitted/features/home/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/service_locator.dart';
import 'measurement/measurement_provider.dart';
import 'products/product_provider.dart';

class AppProviders {
  static List<BlocProvider> getProviders() {
    return [
      ...AuthProviders.getProviders(),
      ...MeasurementProvider.getProviders(),
      ...SettingsProvider.getProviders(),
      ...ApparelProvider.getProviders(),
      ...ProductsProvider.getProviders(),
      BlocProvider<HomeBloc>(
        create: (context) => sl<HomeBloc>(),
      ),
    ];
  }
}
