import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/providers/cart_provider.dart';

class OrderItem {
  final String id;
  final List<CartItem> orderedItems;
  final double amount;
  final DateTime dateTime;
  OrderItem({
    @required this.id,
    @required this.orderedItems,
    @required this.amount,
    @required this.dateTime,
  });
}

class OrderProvider with ChangeNotifier {
  List<OrderItem> _items = [];

  List<OrderItem> get items {
    return [..._items];
  }

  void addOrder(List<CartItem> orderedItems, double amount) {
    _items.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            orderedItems: orderedItems,
            amount: amount,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
