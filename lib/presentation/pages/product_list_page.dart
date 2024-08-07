import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fruit_shop/presentation/providers/cart_provider.dart';
import 'package:fruit_shop/presentation/providers/product_provider.dart';
import 'package:fruit_shop/presentation/routes/router.gr.dart';
import 'package:fruit_shop/domain/entities/product.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      AutoRouter.of(context).push(CartRoute());
                    },
                  ),
                  if (cartProvider.items.isNotEmpty)
                    Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '${cartProvider.items.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context, listen: false).fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Consumer<ProductProvider>(
              builder: (context, provider, _) {
                return GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    return ProductGridTile(product: product);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ProductGridTile extends StatelessWidget {
  final Product product;

  ProductGridTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(ProductDetailRoute(product: product));
              },
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).remove(product);
                },
              ),
              Column(
                children: [
                  Text(product.name, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 4),
                  Text('₹${product.price}', style: TextStyle(fontSize: 16)),
                ],
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).add(product);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
