import 'package:fitted/core/di/service_locator.dart';
import 'package:fitted/features/auth/forgot_password/presentation/bloc/bloc.dart';
import 'package:fitted/features/auth/login/presentation/bloc/bloc.dart';
import 'package:fitted/features/auth/signup/presentation/bloc/bloc.dart';
import 'package:fitted/features/auth/verify_otp/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
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
      BlocProvider<OtpBloc>(
        create: (context) => sl<OtpBloc>(),
      ),
      BlocProvider<ForgotPasswordBloc>(
        create: (context) => sl<ForgotPasswordBloc>(),
      ),
      BlocProvider<MeasurementBloc>(
        create: (context) => sl<MeasurementBloc>(),
      ),
    ];
  }
}
