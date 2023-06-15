import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:myshop/providers/orders.dart' as ord;

class OrdersItem extends StatefulWidget {
  final ord.OrderItem order;
  OrdersItem(this.order);

  @override
  State<OrdersItem> createState() => _OrdersItemState();
}

class _OrdersItemState extends State<OrdersItem> {
  var _expanded = false;
  // const OrdersItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm')
                  .format(widget.order.dateTime)
                  .toString(),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              // duration: Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
              height: min(widget.order.products.length * 20 + 10, 100),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              prod.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('${prod.quantity}x\$${prod.price}',
                                style: const TextStyle(
                                    color: Colors.greenAccent, fontSize: 17))
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
