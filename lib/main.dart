import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myshop/screens/product_detail_screen.dart';
import 'providers/products_provider.dart';
import 'package:myshop/screens/project_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
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
        },
      ),
    );
  }
}
