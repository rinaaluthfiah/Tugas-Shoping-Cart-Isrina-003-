import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: cart.isEmpty
          ? const Center(child: Text('Cart is empty'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ✅ ORDER LIST
                  Expanded(
                    child: ListView(
                      children: cart.itemsList.map(
                            (item) => ListTile(
                              title: Text(item.product.name),
                              subtitle: Text(
                                  '${item.quantity} x Rp ${item.product.price}'),
                              trailing: Text(
                                'Rp ${item.totalPrice.toStringAsFixed(0)}',
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  const Divider(),

                  // ✅ TOTAL
                  Text(
                    'Total: Rp ${cart.totalPrice.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ✅ FORM
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama wajib diisi';
                        }
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ✅ BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cart.clear();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order berhasil dibuat!'),
                            ),
                          );

                          Navigator.popUntil(
                              context, (route) => route.isFirst);
                        }
                      },
                      child: const Text('Place Order'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}