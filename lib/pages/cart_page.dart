import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cart',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
              ),
              Text(
                'Check your cart before paying!',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cartOfProducts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Center(
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              width: 50,
                              cartOfProducts[index].image,
                            ),
                          ),
                          title: Text(
                            cartOfProducts[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text('${cartOfProducts[index].price} \$'),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                deleteFromCart(cartOfProducts[index]);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Text(
                  'Общая сумма: ${allProductsFromCardPrice(cartOfProducts)} \$')
            ],
          ),
        ),
      ),
    );
  }
}
