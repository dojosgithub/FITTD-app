import 'package:fitted/config/providers/apparel/apparel_providers.dart';
import 'package:fitted/config/providers/auth/auth_providers.dart';
import 'package:fitted/config/providers/home/home_provider.dart';
import 'package:fitted/config/providers/measurement/measurement_provider.dart';
import 'package:fitted/config/providers/notification/notification_provider.dart';
import 'package:fitted/config/providers/products/product_provider.dart';
import 'package:fitted/config/providers/search/search_provider.dart';
import 'package:fitted/config/providers/settings/settings_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders {
  static List<BlocProvider> getProviders() {
    return [
      ...AuthProviders.getProviders(),
      ...MeasurementProvider.getProviders(),
      ...SettingsProvider.getProviders(),
      ...ApparelProvider.getProviders(),
      ...ProductsProvider.getProviders(),
      ...SearchProvider.getProviders(),
      ...NotificationProvider.getProviders(),
      ...HomeProvider.getProviders(),
    ];
  }
}
