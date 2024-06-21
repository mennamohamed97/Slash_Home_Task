import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slash_app/presentation/widgets/product_card.dart';

import '../../data/models/product_model.dart';

class SectionWidget extends StatefulWidget {
  final String title;
  final List<Product> products;

  const SectionWidget({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  _SectionWidgetState createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 250,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isScreenSmall = screenWidth < 275;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 20, top: 8, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isScreenSmall
                  ? Flexible(
                      child: Text(
                        widget.title,
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            textBaseline: TextBaseline.alphabetic,
                            height: 33 / 22,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      widget.title,
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          textBaseline: TextBaseline.alphabetic,
                          height: 33 / 22,
                        ),
                      ),
                    ),
              isScreenSmall
                  ? Flexible(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            "See all",
                            style: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                textBaseline: TextBaseline.alphabetic,
                                height: 33 / 22,
                              ),
                            ),
                          ),
                        ),
                        const Flexible(
                            child: SizedBox(
                          width: 10,
                        )),
                        Flexible(
                          child: GestureDetector(
                            onTap: _scrollRight,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xFFEEEEEE),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "See all",
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              textBaseline: TextBaseline.alphabetic,
                              height: 33 / 22,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: _scrollRight,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xFFEEEEEE),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              Product product = widget.products[index];
              return ProductCardWidget(product: product);
            },
          ),
        ),
      ],
    );
  }
}
