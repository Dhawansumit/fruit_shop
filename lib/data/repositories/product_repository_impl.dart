import 'package:fruit_shop/data/datasources/product_local_data_source.dart';
import 'package:fruit_shop/data/models/product_model.dart';
import 'package:fruit_shop/domain/entities/product.dart';
import 'package:fruit_shop/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Product>> getProducts() async {
    return await localDataSource.getProducts();
  }
}
