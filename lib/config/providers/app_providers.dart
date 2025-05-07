import 'package:fitted/config/providers/auth/auth_providers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders {
  static List<BlocProvider> getProviders() {
    return [
      ...AuthProviders.getProviders(),
    ];
  }
}
