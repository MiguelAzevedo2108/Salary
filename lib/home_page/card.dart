import 'package:flutter/material.dart';

class HCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final VoidCallback onPress;

  HCard({required this.color, this.cardChild, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 200.0,
        width: 170.0,
        child: cardChild,
      ),
    );
  }
}
