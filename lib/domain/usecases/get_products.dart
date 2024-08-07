import 'package:fruit_shop/domain/entities/product.dart';
import 'package:fruit_shop/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
