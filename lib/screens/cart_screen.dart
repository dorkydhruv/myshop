import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../widgets/cart_item.dart' as ci;
import '../providers/carts.dart';

class CartScreen extends StatelessWidget {
  //const CartScreen({super.key});
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: Text('your Cart')),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(color: Colors.green[400]),
                    ),
                    backgroundColor: Theme.of(context).canvasColor,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Order Now!'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (_, i) {
              return ci.CartItem(
                  id: cart.items.values.toList()[i].id,
                  cartid: cart.items.keys.toList()[i],
                  price: cart.items.values.toList()[i].price,
                  qty: cart.items.values.toList()[i].quantity,
                  title: cart.items.values.toList()[i].title);
            },
          ))
        ],
      ),
    );
  }
}
