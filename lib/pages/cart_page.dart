// lib/pages/cart_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              if (cart.isEmpty) return const SizedBox.shrink();

              return IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Clear Cart?'),
                      content: const Text('Remove all items?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            cart.clear();
                            Navigator.pop(ctx);
                          },
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      body: Consumer<CartModel>(
        builder: (context, cart, child) {

          if (cart.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return Column(
            children: [

              // LIST ITEM
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {

                    final item = cart.items[index];
                    final product = item.product;

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: ListTile(
                        leading: Text(
                          product.emoji,
                          style: const TextStyle(fontSize: 28),
                        ),
                        title: Text(
                          product.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          'Rp ${product.price.toStringAsFixed(0)}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: SizedBox(
                          width: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              // MINUS
                              IconButton(
                                icon: const Icon(Icons.remove, size: 18),
                                onPressed: () =>
                                    cart.decreaseQuantity(product.id),
                              ),

                              Text(
                                '${item.quantity}',
                                style: const TextStyle(fontSize: 13),
                              ),

                              // PLUS
                              IconButton(
                                icon: const Icon(Icons.add, size: 18),
                                onPressed: () =>
                                    cart.increaseQuantity(product.id),
                              ),

                              // REMOVE BUTTON KHUSUS
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  size: 18,
                                  color: Color.fromARGB(255, 173, 106, 166),
                                ),
                                onPressed: () {
                                  cart.removeItem(product.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('${product.name} removed'),
                                      duration:
                                          const Duration(seconds: 1),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // TOTAL BAR
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 130, 135, 233),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      offset: Offset(0, -2),
                      color: Colors.black12,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: Rp ${cart.totalPrice.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Checkout'),
                            content: Text(
                              'Items: ${cart.totalQuantity}\nTotal: Rp ${cart.totalPrice.toStringAsFixed(0)}',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cart.clear();
                                  Navigator.pop(ctx);
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text('Order placed!'),
                                    ),
                                  );
                                },
                                child: const Text('Confirm'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}