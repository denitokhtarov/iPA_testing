import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String category;
  final String model;
  final List<int> memory;
  final String description;
  final String image;
  final double price;
  final Color? color;
  final int counts;
  final String rating;
  const ProductCard({
    super.key,
    required this.category,
    required this.model,
    required this.memory,
    required this.description,
    required this.image,
    required this.price,
    this.color,
    required this.counts,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              model,
              style: GoogleFonts.inter(
                color: const Color.fromARGB(255, 114, 114, 114),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.star,
              color: Color.fromARGB(255, 255, 209, 59),
              size: 17,
            ),
            Text(
              rating,
              style: GoogleFonts.inter(fontWeight: FontWeight.w900),
            )
          ],
        ),
        Text(
          '\$${price.toInt()}',
          style: GoogleFonts.inter(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
