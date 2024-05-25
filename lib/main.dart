import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimal_eccomerce_app/counter_model.dart';
import 'package:minimal_eccomerce_app/pages/home_page.dart';
import 'package:minimal_eccomerce_app/pages/product_page.dart';
import 'package:minimal_eccomerce_app/pages/screens/favourites_page_screen.dart';
import 'package:minimal_eccomerce_app/pages/shop_page.dart';
import 'package:minimal_eccomerce_app/products_models/products.dart';
import 'package:minimal_eccomerce_app/tabs_model.dart';
import 'package:minimal_eccomerce_app/themes/dark_theme.dart';
import 'package:minimal_eccomerce_app/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
    ),
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CounterModel>(create: (_) => CounterModel()),
    ChangeNotifierProvider(create: (_) => TabsModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      themeMode: ThemeMode.system,
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/home_page': (context) => const HomePage(),
        '/search_page': (context) => const SearchPage(),
        '/favourites_page': (context) {
          return const FavouritesPage();
        },
        '/product_page': (context) {
          final product =
              ModalRoute.of(context)!.settings.arguments as ProductInfo;
          return ProductPage(product: product);
        }
      },
    );
  }
}
