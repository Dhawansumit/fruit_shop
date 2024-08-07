import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fruit_shop/domain/entities/product.dart';
import 'package:fruit_shop/presentation/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final cartItems = cartProvider.items;
          final groupedItems = _groupItems(cartItems);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: groupedItems.length,
                  itemBuilder: (context, index) {
                    final product = groupedItems.keys.elementAt(index);
                    final count = groupedItems[product]!;

                    return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  product.image,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name,
                                          style: TextStyle(fontSize: 16)),
                                      Text('₹${product.price}',
                                          style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        if (count > 1) {
                                          cartProvider.remove(product);
                                        }
                                      },
                                    ),
                                    Text('$count',
                                        style: TextStyle(fontSize: 16)),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        cartProvider.add(product);
                                      },
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    cartProvider.removeAll(product);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ₹${Provider.of<CartProvider>(context).totalPrice}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return ElevatedButton(
                  onPressed: cartProvider.items.isEmpty
                      ? null
                      : () {
                          _showCheckoutDialog(context, cartProvider);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    textStyle: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  child: const Text('Checkout',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                );
              },
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     _showCheckoutDialog(
            //         context, Provider.of<CartProvider>(context, listen: false));
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.green,
            //     padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            //     textStyle: TextStyle(fontSize: 18, color: Colors.black),
            //   ),
            //   child: const Text('Checkout',
            //       style: TextStyle(fontSize: 14, color: Colors.black)),
            // ),
          ],
        ),
      ),
    );
  }

  Map<Product, int> _groupItems(List<Product> items) {
    final Map<Product, int> groupedItems = {};
    for (var item in items) {
      if (groupedItems.containsKey(item)) {
        groupedItems[item] = groupedItems[item]! + 1;
      } else {
        groupedItems[item] = 1;
      }
    }
    return groupedItems;
  }

  void _showCheckoutDialog(BuildContext context, CartProvider cartProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank you for your purchase!'),
          content: Text('Your order has been placed successfully.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                cartProvider.clearCart();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
