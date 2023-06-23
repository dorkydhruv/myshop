import 'package:flutter/material.dart';
import 'package:myshop/widgets/cart_item.dart';

import 'package:provider/provider.dart';
import '../providers/carts.dart' as ci;
// import '../providers/carts.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  //const CartScreen({super.key});
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ci.Cart>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('your Cart')),
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
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.green[400]),
                    ),
                    backgroundColor: Theme.of(context).canvasColor,
                  ),
                  OrderBUtton(cart: cart)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (_, i) {
              return CartItems(
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

class OrderBUtton extends StatefulWidget {
  const OrderBUtton({
    super.key,
    required this.cart,
  });

  final ci.Cart cart;

  @override
  State<OrderBUtton> createState() => _OrderBUttonState();
}

class _OrderBUttonState extends State<OrderBUtton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator(
            color: Colors.green,
          )
        : TextButton(
            onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
                ? null
                : () async {
                    setState(() {
                      _isLoading = true;
                    });
                    await Provider.of<Orders>(context, listen: false).addOrder(
                      widget.cart.items.values.toList(),
                      widget.cart.totalAmount,
                    );
                    setState(() {
                      _isLoading = false;
                    });
                    widget.cart.clearCart();
                  },
            child: const Text('Order Now!'),
          );
  }
}
