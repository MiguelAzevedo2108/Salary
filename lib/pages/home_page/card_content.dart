import 'package:flutter/cupertino.dart';

class CardContent extends StatelessWidget {
  final IconData icon;
  final String text;

  CardContent({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}