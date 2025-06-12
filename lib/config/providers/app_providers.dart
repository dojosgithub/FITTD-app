import 'package:fitted/config/providers/apparel/apparel_providers.dart';
import 'package:fitted/config/providers/auth/auth_providers.dart';
import 'package:fitted/config/providers/measurement/measurement_provider.dart';
import 'package:fitted/config/providers/products/product_provider.dart';
import 'package:fitted/config/providers/settings/settings_provider.dart';
import 'package:fitted/core/di/service_locator.dart';
import 'package:fitted/features/home/presentation/bloc/bloc.dart';
import 'package:fitted/features/search/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      BlocProvider<SearchBloc>(
        create: (context) => sl<SearchBloc>(),
      ),
    ];
  }
}
