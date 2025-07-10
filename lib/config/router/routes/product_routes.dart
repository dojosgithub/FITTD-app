import 'package:go_router/go_router.dart';
import '../enum/app_routes_enum.dart';
import 'route_helpers.dart';
import 'package:fitted/features/products/presentation/screens/guest_product_view.dart';
import 'package:fitted/features/products/presentation/screens/products_detail_view.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';

final productRoutes = [
  GoRoute(
    path: AppRoutesEnum.productsDetailView.path,
    name: AppRoutesEnum.productsDetailView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: ProductsDetailView(
        productId: (state.extra as Map)['id'],
      ),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.guestProductsDetailView.path,
    name: AppRoutesEnum.guestProductsDetailView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: GuestProductsDetailView(
        productId: (state.extra as Map)['id'],
        userId: (state.extra as Map)['uid'],
      ),
    ),
  ),
];
