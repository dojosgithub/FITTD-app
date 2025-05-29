import 'package:fitted/features/apparel/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';

class ApparelProvider {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<ApparelBloc>(
        create: (context) => sl<ApparelBloc>(),
      ),
    ];
  }
}
