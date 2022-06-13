import 'package:flutter/material.dart';
import 'package:nm_shop/providers/cart.dart';
import 'package:nm_shop/screens/cart_screen.dart';
import 'package:nm_shop/widgets/app_drawer.dart';
import 'package:nm_shop/widgets/badge.dart';
import 'package:nm_shop/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilterOption { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NM Shop'),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (FilterOption selectedValue) => {
                    setState(() {
                      if (selectedValue == FilterOption.favorites) {
                        _showOnlyFavorites = true;
                      } else {
                        _showOnlyFavorites = false;
                      }
                    })
                  },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOption.favorites),
                    const PopupMenuItem(
                        child: Text('Show All'), value: FilterOption.all),
                  ]),
          Consumer<Cart>(
            builder: (_, cartData, ch) =>
                Badge(child: ch!, value: cartData.itemCount.toString()),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
