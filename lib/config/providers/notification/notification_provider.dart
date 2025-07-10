import 'package:fitted/core/di/service_locator.dart';
import 'package:fitted/features/notifications/presentation/bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class NotificationProvider {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<NotificationBloc>(
        create: (context) => sl<NotificationBloc>(),
      ),
    ];
  }
}
