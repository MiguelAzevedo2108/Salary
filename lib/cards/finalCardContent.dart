import 'package:flutter/cupertino.dart';

class FinalCardContent extends StatelessWidget {
  final double value;
  final String text;

  const FinalCardContent({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF616482),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            value.round().toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8488b2),
            ),
          ),
        ),
      ],
    );
  }
}
