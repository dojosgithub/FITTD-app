import 'package:fitted/features/measurement/data/enums/measurement_route_enum.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/presentation/widgets/female_measurement_label.dart';
import 'package:fitted/features/measurement/presentation/widgets/male_measurement_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';
import '../../../../../config/widgets/buttons/primary/primary_button.dart';
import '../background_grid.dart';

class StandardMeasurements extends StatelessWidget {
  const StandardMeasurements({super.key, required this.state});
  final MeasurementState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: GridPainter(),
              ),
              state.style == "male"
                  ? MaleMeasurementLabelsPanel(
                      measurementModel: state.maleMeasurementModel,
                    )
                  : FemaleMeasurementLabelsPanel(
                      measurementModel: state.femaleMeasurementModel,
                    ),
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: CustomButton(
                    onTap: () => context.pushNamed(
                        AppRoutesEnum.userInfoView.name,
                        queryParameters: {
                          'context': MeasurementRouteEnum.back.name,
                        }),
                    text: "Update Measurements",
                    height: 46.h,
                    width: 319.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
