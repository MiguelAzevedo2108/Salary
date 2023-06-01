import 'package:flutter/material.dart';

class YesNoCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final VoidCallback onPress;

  YesNoCard({required this.color, this.cardChild, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 65.0,
          width: 110.0,
          child: cardChild,
        ),
    );
  }
}
