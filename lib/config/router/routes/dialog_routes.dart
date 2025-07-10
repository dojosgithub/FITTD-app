import 'package:fitted/config/helper/dialog/dialog_page.dart';
import 'package:fitted/features/measurement/presentation/dialogs/confirmation_dialog.dart';
import 'package:fitted/features/measurement/presentation/dialogs/update_other_measurements.dart';
import 'package:fitted/features/products/presentation/dialog/product_url_dialog.dart';
import 'package:fitted/features/settings/dialogs/delete_dialog.dart';
import 'package:fitted/features/settings/dialogs/log_out_dialog.dart';
import 'package:go_router/go_router.dart';
import '../enum/app_routes_enum.dart';

final dialogRoutes = [
  GoRoute(
    path: AppRoutesEnum.confirmationDialog.path,
    name: AppRoutesEnum.confirmationDialog.name,
    pageBuilder: (context, state) => DialogPage(
      builder: (_) => ConfirmationDialog(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.updateOtherMeasurements.path,
    name: AppRoutesEnum.updateOtherMeasurements.name,
    pageBuilder: (context, state) => DialogPage(
      builder: (_) => UpdateOtherMeasurements(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.deleteDialog.path,
    name: AppRoutesEnum.deleteDialog.name,
    pageBuilder: (context, state) => DialogPage(
      builder: (_) => DeleteAccountDialog(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.logOutDialog.path,
    name: AppRoutesEnum.logOutDialog.name,
    pageBuilder: (context, state) => DialogPage(
      builder: (_) => LogOutDialog(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.productUrlDialog.path,
    name: AppRoutesEnum.productUrlDialog.name,
    pageBuilder: (context, state) => DialogPage(
      builder: (_) => ProductUrlDialog(),
    ),
  ),
];
