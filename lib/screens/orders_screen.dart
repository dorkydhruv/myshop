import 'package:flutter/material.dart';
import 'package:myshop/widgets/AppDrawer.dart';
import 'package:myshop/widgets/oders_item.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  // const OrdersScreen({super.key});
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders!')),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: ordersData.orders.length,
          itemBuilder: (_, i) => OrdersItem(ordersData.orders[i])),
    );
  }
}
