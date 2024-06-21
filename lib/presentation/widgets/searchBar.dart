import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var screenWidth = constraints.maxWidth;
        double iconSize = screenWidth > 600 ? 50 : screenWidth * 0.1;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 47,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x85E4E4E4),
                    hintText: 'Search here..',
                    hintStyle: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textBaseline: TextBaseline.alphabetic,
                        color: Color(0xFF969696),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16.0,
                    ),
                    prefixIcon: const Image(
                      image: AssetImage("assets/images/search.png"),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: iconSize,
              height: 47,
              decoration: BoxDecoration(
                color: const Color(0x85E4E4E4),
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              child: const Image(
                image: AssetImage("assets/images/filter.png"),
              ),
            ),
          ],
        );
      },
    );
  }
}
