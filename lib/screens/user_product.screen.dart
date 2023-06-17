import 'package:flutter/material.dart';
import 'package:myshop/providers/products_provider.dart';
import 'package:myshop/widgets/AppDrawer.dart';
import 'package:myshop/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product-screen';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products!'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  UserProductItem(productData.items[i].title,
                      productData.items[i].imageUrl),
                  Divider(color: Colors.black45),
                ],
              );
            },
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
