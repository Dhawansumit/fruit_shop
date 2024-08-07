import 'package:json_annotation/json_annotation.dart';
import 'package:fruit_shop/domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  ProductModel({
    required String name,
    required double price,
    required String image,
  }) : super(name: name, price: price, image: image);

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
