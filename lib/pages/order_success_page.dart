import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  final String customerName;
  final double total;

  const OrderSuccessPage({
    super.key,
    required this.customerName,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 100),
              const SizedBox(height: 20),
              const Text(
                "Order Berhasil!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text("Terima kasih, $customerName"),
              const SizedBox(height: 10),
              Text("Total: Rp ${total.toStringAsFixed(0)}"),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text("Kembali ke Halaman Utama"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
