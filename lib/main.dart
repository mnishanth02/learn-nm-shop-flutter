import 'package:flutter/material.dart';
import 'package:nm_shop/providers/cart.dart';
import 'package:nm_shop/providers/orders.dart';
import 'package:nm_shop/screens/cart_screen.dart';
import 'package:nm_shop/screens/orders_screen.dart';
import 'package:nm_shop/screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import '../screens/products_overview_screen.dart';

import 'providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: Colors.deepOrange, primary: Colors.purple),
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routename: (ctx) => const OrdersScreen()
        },
      ),
    );
  }
}
