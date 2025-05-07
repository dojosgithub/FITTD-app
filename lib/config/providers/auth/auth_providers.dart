import 'package:fitted/core/di/service_locator.dart';
import 'package:fitted/features/auth/login/bloc/bloc.dart';
import 'package:fitted/features/auth/signup/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthProviders {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<LoginBloc>(
        create: (context) => sl<LoginBloc>(),
      ),
      BlocProvider<SignInBloc>(
        create: (context) => sl<SignInBloc>(),
      ),
    ];
  }
}
