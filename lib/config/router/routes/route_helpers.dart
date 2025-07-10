import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../helper/dialog/dialog_page.dart';

// CustomTransitionPage buildTransitionPage({required Widget child}) {
//   return CustomTransitionPage(
//     child: child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return FadeTransition(opacity: animation, child: child);
//     },
//   );
// }

GoRoute dialogRoute(String path, String name, Widget dialog) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => DialogPage(builder: (_) => dialog),
  );
}
