import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/order_provider.dart';
import 'package:flutter_complete_guide/screens/common_widgets/app_drawer.dart';
import 'package:flutter_complete_guide/screens/order_screen_widgets/order_component.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.items.length,
        itemBuilder: (ctx, i) => OrderComponent(orderData.items[i]),
      ),
    );
  }
}
