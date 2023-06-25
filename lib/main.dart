import 'package:flutter/material.dart';
import 'package:myshop/providers/auth.dart';
import 'package:myshop/providers/carts.dart';
import 'package:myshop/providers/orders.dart';
// import 'package:myshop/providers/product.dart';
import 'package:myshop/screens/268%20auth_screen.dart';
import 'package:myshop/screens/281%20splash_screen.dart';
import 'package:myshop/screens/cart_screen.dart';
import 'package:myshop/screens/edit_product_screen.dart';
import 'package:myshop/screens/orders_screen.dart';
import 'package:myshop/screens/user_product.screen.dart';
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
          ChangeNotifierProvider(create: (tx) => Auth()),
          ChangeNotifierProxyProvider<Auth, Products>(
            create: (_) => Products(null, [], null),
            update: ((context, auth, previousProducts) => Products(
                auth.token,
                previousProducts == null ? [] : previousProducts.items,
                auth.userId)),
          ),
          // ChangeNotifierProvider(create: (context)=> ProductOverViewScreen()),
          ChangeNotifierProvider(create: (context) => Cart()),
          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (ctc) => Orders(null, [], null),
            update: (context, auth, previousOrder) => Orders(auth.token!,
                previousOrder == null ? [] : previousOrder.orders, auth.userId),
          ),
        ],
        child: Consumer<Auth>(
          builder: (context, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyShop',
            theme: ThemeData(
                primarySwatch: Colors.purple,
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: Colors.deepOrange),
                fontFamily: 'Lato',
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            // initialRoute: AuthScreen.routeName,
            home: auth.isAuth
                ? ProductOverViewScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen(),
                  ),
            routes: {
              ProductOverViewScreen.routeName: (context) =>
                  ProductOverViewScreen(),
              ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
              CartScreen.routeName: (context) => CartScreen(),
              OrdersScreen.routeName: (context) => OrdersScreen(),
              UserProductsScreen.routeName: (context) => UserProductsScreen(),
              EditProductScreen.routeName: (con) => EditProductScreen()
            },
          ),
        ));
  }
}
