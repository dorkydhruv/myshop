import 'package:flutter/material.dart';
import 'package:myshop/providers/products_provider.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider(
            create: (context) => products[index],
            child: ProductItem(
                /* products[index].id, products[index].title,
                products[index].imageUrl */
                ),
          );
        });
  }
}