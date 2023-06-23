import 'package:flutter/material.dart';
import 'package:myshop/widgets/AppDrawer.dart';
import 'package:myshop/widgets/oders_item.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatefulWidget {
  // const OrdersScreen({super.key});
  static const routeName = '/orders-screen';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late Future _ordersFuture;

  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture(); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final ordersData = Provider.of<Orders>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Your Orders!')),
        drawer: AppDrawer(),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.error != null) {
              return const Center(
                child: Text('An error occured!!'),
              );
            } else {
              return Consumer<Orders>(
                  builder: (ctc, ordersData, child) => ListView.builder(
                      itemCount: ordersData.orders.length,
                      itemBuilder: (_, i) => OrdersItem(ordersData.orders[i])));
            }
          },
          future: _ordersFuture,
        ));
  }
}
