import 'package:go_router/go_router.dart';
import '../enum/app_routes_enum.dart';
import 'route_helpers.dart';
import 'package:fitted/features/measurement/presentation/screen/face_measurement_view.dart';
import 'package:fitted/features/measurement/presentation/screen/feet_measurement_view.dart';
import 'package:fitted/features/measurement/presentation/screen/hand_measurement_view.dart';
import 'package:fitted/features/measurement/presentation/screen/head_measurement_view.dart';
import 'package:fitted/features/measurement/presentation/screen/face_measurement_form_view.dart';
import 'package:fitted/features/measurement/presentation/screen/feet_measurement_form_view.dart';
import 'package:fitted/features/measurement/presentation/screen/hand_measurement_form_view.dart';
import 'package:fitted/features/measurement/presentation/screen/head_measurement_form_view.dart';
import 'package:fitted/features/measurement/presentation/screen/size_preview_view.dart';
import 'package:fitted/features/measurement/presentation/screen/user_info_view.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';

final measurementRoutes = [
  GoRoute(
    path: AppRoutesEnum.userInfoView.path,
    name: AppRoutesEnum.userInfoView.name,
    builder: (context, state) => UserInfoView.fromState(state),
  ),
  GoRoute(
    path: AppRoutesEnum.sizePreview.path,
    name: AppRoutesEnum.sizePreview.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: SizePreviewView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.faceMeasurementFormView.path,
    name: AppRoutesEnum.faceMeasurementFormView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: FaceMeasurementFormView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.feetMeasurementFormView.path,
    name: AppRoutesEnum.feetMeasurementFormView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: FeetMeasurementFormView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.handMeasurementFormView.path,
    name: AppRoutesEnum.handMeasurementFormView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: HandMeasurementFormView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.headMeasurementFormView.path,
    name: AppRoutesEnum.headMeasurementFormView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: HeadMeasurementFormView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.faceMeasurementView.path,
    name: AppRoutesEnum.faceMeasurementView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: FaceMeasurementView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.feetMeasurementView.path,
    name: AppRoutesEnum.feetMeasurementView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: FeetMeasurementView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.handMeasurementView.path,
    name: AppRoutesEnum.handMeasurementView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: HandMeasurementView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.headMeasurementView.path,
    name: AppRoutesEnum.headMeasurementView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: HeadMeasurementView(),
    ),
  ),
];
