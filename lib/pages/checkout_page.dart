import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import 'order_success_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: ListView(
                      children: cart.itemsList.map((item) {
                        return ListTile(
                          title: Text(item.product.name),
                          subtitle: Text(
                            '${item.quantity} x Rp ${item.product.price}',
                          ),
                          trailing: Text(
                            'Rp ${item.totalPrice.toStringAsFixed(0)}',
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const Divider(),

                  Text(
                    'Total: Rp ${cart.totalPrice.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(),
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

                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Alamat wajib diisi";
                      }
                      if (value.length < 8) {
                        return "Alamat terlalu pendek";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Nomor HP",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nomor HP wajib diisi";
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "Nomor HP harus berupa angka";
                      }
                      if (value.length < 10) {
                        return "Nomor HP tidak valid";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: noteController,
                    decoration: InputDecoration(
                      labelText: "Catatan (Opsional)",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final totalPrice = cart.totalPrice;
                          final customerName = nameController.text;

                          cart.clear();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderSuccessPage(
                                customerName: customerName,
                                total: totalPrice,
                              ),
                            ),
                          );
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
