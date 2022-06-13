import 'package:flutter/material.dart';
import 'package:nm_shop/providers/orders.dart' show Orders;
import 'package:nm_shop/widgets/app_drawer.dart';
import 'package:nm_shop/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routename = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            OrderItem(order: orderData.orders[index]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
