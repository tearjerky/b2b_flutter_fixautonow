
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 4 : 4,
      width: isActive ? 20 : 20,
      decoration: BoxDecoration(
        color: isActive ? Colors.white: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
    );
  }
}