import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myshop/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const UserProductItem(this.id, this.title, this.imageUrl, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl,
        ),
      ),
      trailing: SizedBox(
        width: min(200, 100),
        child: Row(children: [
          IconButton(onPressed: () {
                            Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);

          }, icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ))
        ]),
      ),
    );
  }
}
