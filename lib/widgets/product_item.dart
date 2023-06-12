import 'package:flutter/material.dart';
import 'package:myshop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  /* final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl); */

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: Theme.of(context).colorScheme.secondary),
          title: Text(
            productData.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: productData.id);
          },
          child: Image.network(
            productData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
