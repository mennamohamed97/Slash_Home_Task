import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class navBar extends StatefulWidget {
  @override
  _navBarState createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {});
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      iconSize: 24,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      selectedLabelStyle: GoogleFonts.urbanist(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          height: 1.5,
        ),
      ),
      unselectedLabelStyle: GoogleFonts.urbanist(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
      ),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/home.png'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/fav.png'),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/cart.png'),
          label: 'My Cart',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/person.png'),
          label: 'Profile',
        ),
      ],
    );
  }
}
