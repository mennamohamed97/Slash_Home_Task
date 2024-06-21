import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class categories extends StatefulWidget {
  categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
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

  final List<String> categoryImages = [
    "assets/images/shirt.png",
    "assets/images/game.png",
    "assets/images/Glasses.png",
    "assets/images/Book.png",
    "assets/images/palette.png",
    "assets/images/dog.png",
  ];

  final List<String> categoryTexts = [
    "Fashion",
    "Games",
    "Accessories",
    "Books",
    "Artifacts",
    "Pets Care",
  ];
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Categories',
                  style: GoogleFonts.urbanist(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      textBaseline: TextBaseline.alphabetic,
                      height: 33 / 22,
                    ),
                  ),
                ),
              ),
              Flexible(
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
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: categoryImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF292929),
                      ),
                      width: 72,
                      height: 72,
                      child: Image.asset(
                        categoryImages[index],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      categoryTexts[index],
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 21 / 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
