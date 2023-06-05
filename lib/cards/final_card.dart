import 'package:flutter/cupertino.dart';

class FinalCard extends StatelessWidget {
  final Widget? cardChild;
  final Color color;

  const FinalCard({super.key, required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 70.0,
      width: 350.0,
      child: cardChild,
    );
  }
}