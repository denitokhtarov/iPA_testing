import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              Lottie.asset('assets/shopping_cart.json',
                  width: 250, height: 250),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'MINIMAL SHOP',
                style: TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 41, 41, 41),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Made by Deni',
                style: TextStyle(color: Color.fromARGB(59, 58, 58, 58)),
              ),
              const SizedBox(height: 30),
              Material(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  highlightColor: const Color.fromARGB(255, 235, 235, 235),
                  onTap: () {
                    Navigator.pushNamed(context, '/home_page');
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: Color.fromARGB(255, 41, 41, 41),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
