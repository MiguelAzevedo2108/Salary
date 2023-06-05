

import 'package:flutter/cupertino.dart';

import '../pages/home_page/home_page.dart';

class FinalCard extends StatelessWidget {
  final Widget? cardChild;

  FinalCard({this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, bottom: 20),
      decoration: BoxDecoration(
        color: standardCardColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 70.0,
      width: 350.0,
      child: cardChild,
    );
  }
}