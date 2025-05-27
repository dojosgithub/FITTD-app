import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/features/measurement/data/enums/measurement_route_enum.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/choose_height.dart';
import '../widgets/choose_your_fit.dart';
import '../widgets/choose_your_style.dart';
import '../widgets/female/enter_measurements_lower.dart';
import '../widgets/female/enter_measurements_upper.dart';
import '../widgets/male/enter_measurements_lower.dart';
import '../widgets/male/enter_measurements_upper.dart';

class UserInfoView extends StatelessWidget {
  final MeasurementRouteEnum contextType;

  const UserInfoView({
    super.key,
    required this.contextType,
  });

  static MeasurementRouteEnum _getContextTypeFromString(String value) {
    return MeasurementRouteEnum.values.firstWhere(
      (e) => e.name == value,
      orElse: () => MeasurementRouteEnum.home,
    );
  }

  factory UserInfoView.fromState(GoRouterState state) {
    final contextTypeString = state.uri.queryParameters['context'] ?? '';
    final contextType = _getContextTypeFromString(contextTypeString);
    return UserInfoView(contextType: contextType);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MeasurementBloc, MeasurementState>(
        listenWhen: (previous, current) =>
            previous.isSuccess != current.isSuccess,
        listener: (context, state) {
          if (state.isSuccess && MeasurementRouteEnum.home == contextType) {
            context.pushReplacementNamed(
              AppRoutesEnum.main.name,
              extra: {
                "showDialog": true,
              },
            );
          } else if (state.isSuccess &&
              MeasurementRouteEnum.back == contextType) {
            context.pushReplacementNamed(
              AppRoutesEnum.main.name,
            );
          }
        },
        builder: (context, state) {
          final widgets = _buildOnboardingWidgets(state);

          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProgressIndicator(state, widgets.length),
                  ],
                ),
                widgets[state.currentIndex.clamp(0, widgets.length - 1)],
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildOnboardingWidgets(MeasurementState state) {
    return [
      const ChooseYourStyleWidget(),
      const ChooseYourFitWidget(),
      const SetHeightWidget(),
      if (state.style == "male") ...[
        const MaleUpperMeasureWidget(),
        const MaleLowerMeasureWidget(),
      ] else if (state.style == "female") ...[
        const FemaleUpperMeasureWidget(),
        const FemaleLowerMeasureWidget(),
      ],
    ];
  }

  Widget _buildProgressIndicator(MeasurementState state, int length) {
    return Container(
      margin: EdgeInsets.only(
        top: 82.h,
        bottom: state.currentIndex != 2 ? 80 : 28,
      ),
      width: 1.sw,
      height: 6,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListView.separated(
            itemCount: length,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            separatorBuilder: (context, index) => Spacers.spacer8,
            itemBuilder: (context, index) => Container(
              width: 59,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(43.r),
                color: index <= state.currentIndex
                    ? AppColors.orangePrimary
                    : AppColors.grey.withValues(alpha: 0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
