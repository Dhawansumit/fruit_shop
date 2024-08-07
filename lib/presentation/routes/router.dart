import 'package:auto_route/auto_route.dart';
import 'package:fruit_shop/presentation/pages/cart_page.dart';
import 'package:fruit_shop/presentation/pages/product_detail_page.dart';
import 'package:fruit_shop/presentation/pages/product_list_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ProductListPage, initial: true),
    AutoRoute(page: ProductDetailPage),
    AutoRoute(page: CartPage),
  ],
)
class $AppRouter {}
