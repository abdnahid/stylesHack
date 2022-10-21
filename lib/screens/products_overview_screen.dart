import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart_provider.dart';
import 'package:flutter_complete_guide/screens/cart_screen.dart';
import 'package:flutter_complete_guide/screens/common_widgets/badge.dart';
import 'package:provider/provider.dart';
import 'products_overview_widgets/product_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                isFavorite = value;
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    child: Text("All products"),
                    value: false,
                  ),
                  PopupMenuItem(
                    child: Text("Favorites"),
                    value: true,
                  ),
                ]),
          ),
          Container(
            width: 100,
            child: Consumer<CartProvider>(
              builder: (context, value, ch) => Badge(
                child: ch,
                value: value.itemCount.toString(),
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: Icon(Icons.shopping_bag)),
            ),
          )
        ],
      ),
      body: ProductGrid(isFavorite: isFavorite),
    );
  }
}
