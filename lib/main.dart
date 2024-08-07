import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fruit_shop/core/utils/service_locator.dart' as di;
import 'package:fruit_shop/presentation/providers/cart_provider.dart';
import 'package:fruit_shop/presentation/providers/product_provider.dart';
import 'package:fruit_shop/presentation/routes/router.gr.dart';

import 'data/datasources/product_local_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await di.sl<ProductLocalDataSource>().loadInitialData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.sl<ProductProvider>()),
        ChangeNotifierProvider(create: (_) => di.sl<CartProvider>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Fruit Shop',
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
