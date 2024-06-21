import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class offer extends StatefulWidget {
  const offer({Key? key}) : super(key: key);

  @override
  _offerState createState() => _offerState();
}

class _offerState extends State<offer> {
  final ScrollController _scrollController = ScrollController();
  double _containerWidth = 327;
  double _containerHeight = 116;
  bool _isScrollingReverse = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      _containerWidth = 327 + _scrollController.offset / 20;
      _containerHeight = 116 + _scrollController.offset / 20;
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        _isScrollingReverse = true;
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _isScrollingReverse = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10, top: 5),
      child: Column(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: const Image(
                      image: AssetImage("assets/images/offer1.png")),
                ),
                const SizedBox(
                  width: 15,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _containerWidth,
                  height: _containerHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xffc12222),

                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(_isScrollingReverse ? 3.14159 : 0),
            child: const Image(
              image: AssetImage("assets/images/dots.png"),
            ),
          ),
        ],
      ),
    );
  }
}
