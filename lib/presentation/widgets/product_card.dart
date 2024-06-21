import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/product_model.dart';

class ProductCardWidget extends StatefulWidget {
  final Product product;

  const ProductCardWidget({
    super.key,
    required this.product,
  });

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool isLiked = false;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    widget.product.image,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFEEEEEE),
                      ),
                      child: isLiked
                          ? const Icon(
                              Icons.favorite,
                              color: Color(0xffc12222),
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Color(0xFF000000),
                              size: 20,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textBaseline: TextBaseline.alphabetic,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'EGP ${widget.product.price}',
                  style: GoogleFonts.urbanist(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      textBaseline: TextBaseline.alphabetic,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Image.asset(
                  widget.product.brand,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 19,
                            )
                          : const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 19,
                            )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
