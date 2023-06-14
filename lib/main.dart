import 'package:flutter/material.dart';
import 'package:myshop/providers/carts.dart';
import 'package:myshop/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:myshop/screens/product_detail_screen.dart';
import 'providers/products_provider.dart';
import 'package:myshop/screens/project_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrange),
            fontFamily: 'Lato',
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  fontFamily: 'Anton',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen()
        },
      ),
    );
  }
}
