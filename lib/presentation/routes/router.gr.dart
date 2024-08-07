// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../domain/entities/product.dart' as _i6;
import '../pages/cart_page.dart' as _i3;
import '../pages/product_detail_page.dart' as _i2;
import '../pages/product_list_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ProductListRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.ProductListPage(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ProductDetailPage(product: args.product),
      );
    },
    CartRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.CartPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          ProductListRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          ProductDetailRoute.name,
          path: '/product-detail-page',
        ),
        _i4.RouteConfig(
          CartRoute.name,
          path: '/cart-page',
        ),
      ];
}

/// generated route for
/// [_i1.ProductListPage]
class ProductListRoute extends _i4.PageRouteInfo<void> {
  const ProductListRoute()
      : super(
          ProductListRoute.name,
          path: '/',
        );

  static const String name = 'ProductListRoute';
}

/// generated route for
/// [_i2.ProductDetailPage]
class ProductDetailRoute extends _i4.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({required _i6.Product product})
      : super(
          ProductDetailRoute.name,
          path: '/product-detail-page',
          args: ProductDetailRouteArgs(product: product),
        );

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({required this.product});

  final _i6.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{product: $product}';
  }
}

/// generated route for
/// [_i3.CartPage]
class CartRoute extends _i4.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart-page',
        );

  static const String name = 'CartRoute';
}
