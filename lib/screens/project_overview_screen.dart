import 'package:flutter/material.dart';
import 'package:myshop/providers/carts.dart';
import 'package:myshop/screens/cart_screen.dart';
import 'package:myshop/widgets/AppDrawer.dart';
import 'package:provider/provider.dart';
import '../widgets/207 badge.dart';
import '../widgets/products_grid.dart';

enum FilterOptions { Favourites, All }

class ProductOverViewScreen extends StatefulWidget {
  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  bool showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    //final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedvalue) {
              setState(() {
                if (selectedvalue == FilterOptions.Favourites) {
                  showOnlyFavorites = true;
                } else {
                  showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favourites,
                child: Text('Only Favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text(' Show all'),
              ),
            ],
            icon: const Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (ctc, cart, child) {
              return Badges(
                value: cart.itemCount.toString(),
                child: child as Widget,
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(showOnlyFavorites),
    );
  }
}
