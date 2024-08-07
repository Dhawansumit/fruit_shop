import 'package:fruit_shop/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
