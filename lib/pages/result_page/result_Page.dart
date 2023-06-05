
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../cards/finalCard.dart';
import '../../cards/finalCardContent.dart';
import '../home_page/home_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<StatefulWidget> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FinalCard(cardChild: FinalCardContent(text: "Salario Bruto", value: salary.salaryAmount)),
          FinalCard(cardChild: const FinalCardContent(text: "Salario Bruto", value: 100))
          //FinalCard(),
        ],
      ),
    );
  }
}