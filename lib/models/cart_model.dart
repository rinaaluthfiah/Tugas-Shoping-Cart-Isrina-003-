import 'package:flutter/material.dart';
import 'product.dart';
import 'cart_item.dart';

class CartModel extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  int get itemCount => _items.length;

  List<CartItem> get itemsList {
  return _items.values.toList();
}

  int get totalQuantity =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.values.fold(0, (sum, item) => sum + item.totalPrice);

  bool get isEmpty => _items.isEmpty;

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void increaseQuantity(String id) {
    _items[id]!.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(String id) {
    if (_items[id]!.quantity > 1) {
      _items[id]!.quantity--;
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}