import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/carts.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String cartid;
  final double price;
  final int qty;
  final String title;
  CartItems(
      {required this.id,
      required this.cartid,
      required this.price,
      required this.qty,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(cartid);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text(
                      'Do you want to remove the item from the cart?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('NO'),
                    ),
                    TextButton(
                      child: const Text('YES'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                ));
      },
      background: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          size: 35,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('\$$price', softWrap: true)),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total : \$${(price * qty)}'),
            trailing: Text('$qty x'),
          ),
        ),
      ),
    );
  }
}
