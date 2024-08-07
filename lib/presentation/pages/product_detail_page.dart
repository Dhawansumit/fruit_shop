import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fruit_shop/domain/entities/product.dart';
import 'package:fruit_shop/presentation/providers/cart_provider.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false).add(product);
                          },
                          child: Text('Add to Cart' , style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('Price: ₹${product.price}', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 8),
                    Text('Category: Fruit', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
