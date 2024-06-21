import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isScreenSmall = screenWidth < 220;
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Slash.',
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                      child: Image(
                          image: AssetImage("assets/images/location.png"))),
                  const Flexible(
                    child: SizedBox(
                      width: 15,
                    ),
                  ),
                  isScreenSmall
                      ? Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Nasr City',
                                style: GoogleFonts.urbanist(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    textBaseline: TextBaseline.alphabetic,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                'Cairo',
                                style: GoogleFonts.urbanist(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                    textBaseline: TextBaseline.alphabetic,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Text(
                              'Nasr City',
                              style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  textBaseline: TextBaseline.alphabetic,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              'Cairo',
                              style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                  textBaseline: TextBaseline.alphabetic,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                  const Flexible(
                    child: SizedBox(
                      width: 15,
                    ),
                  ),
                  const Flexible(
                      child:
                          Image(image: AssetImage("assets/images/down.png"))),
                ],
              ),
            ),
            const Flexible(
                child:
                    Image(image: AssetImage("assets/images/notification.png"))),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
