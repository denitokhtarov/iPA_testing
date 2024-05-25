import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minimal_eccomerce_app/product.dart';
import 'package:minimal_eccomerce_app/products_models/products.dart';

Future<List<Product>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List<dynamic>;
    final products =
        json.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
    return products;
  } else {
    throw Exception('Failed to load...');
  }
}

List<Product> cartOfProducts = [];

void addToCart(ProductInfo product, int? memory) {
  favouritesProdusts.add([product, memory]);
}

void deleteFromCart(Product product) {
  cartOfProducts.remove(product);
}

String allProductsFromCardPrice(List<Product> cart) {
  num price = 0;
  for (var element in cartOfProducts) {
    price += element.price;
  }

  return price.toStringAsFixed(2);
}
