import 'package:flutter/material.dart';
import 'package:myshop/screens/orders_screen.dart';
import 'package:myshop/screens/user_product.screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () =>
                Navigator.of(context).pushNamed(OrdersScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Products'),
            onTap: () =>
                Navigator.of(context).pushNamed(UserProductsScreen.routeName),
          )
        ],
      ),
    );
  }
}
