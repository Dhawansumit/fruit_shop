import 'package:get_it/get_it.dart';
import 'package:fruit_shop/data/datasources/product_local_data_source.dart';
import 'package:fruit_shop/data/repositories/product_repository_impl.dart';
import 'package:fruit_shop/domain/repositories/product_repository.dart';
import 'package:fruit_shop/domain/usecases/get_products.dart';
import 'package:fruit_shop/presentation/providers/cart_provider.dart';
import 'package:fruit_shop/presentation/providers/product_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Providers
  sl.registerFactory(() => ProductProvider(getProducts: sl()));
  sl.registerFactory(() => CartProvider());

  // Use cases
  sl.registerLazySingleton(() => GetProducts(sl()));

  // Repositories
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(localDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl());
}
