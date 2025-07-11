import 'package:go_router/go_router.dart';
import '../enum/app_routes_enum.dart';
import 'package:fitted/features/search/presentation/screens/search_results_view.dart';
import 'package:fitted/features/search/presentation/screens/search_view.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';

final searchRoutes = [
  GoRoute(
    path: AppRoutesEnum.searchView.path,
    name: AppRoutesEnum.searchView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: SearchView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.searchResultsView.path,
    name: AppRoutesEnum.searchResultsView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: SearchResultsView(),
    ),
  ),
];
