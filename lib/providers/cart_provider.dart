import 'package:flutter/cupertino.dart';

class CartItem {
  String id;
  String title;
  double price;
  int quantity;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double result = 0.0;

    _items.forEach((key, item) {
      result += item.price * item.quantity;
    });
    return result;
  }

  void addCartItem(id, title, price) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (item) => CartItem(
            id: item.id,
            title: item.title,
            price: item.price,
            quantity: item.quantity + 1),
      );
    } else {
      _items.putIfAbsent(
          id, () => CartItem(id: id, title: title, price: price, quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
