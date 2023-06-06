import 'package:flutter/material.dart';
import 'package:salary/pages/meal_page/meal_page.dart';

import '../../cards/final_card.dart';
import '../../cards/final_card_content.dart';
import '../home_page/home_page.dart';

class ResultPageLiquid extends StatefulWidget {
  const ResultPageLiquid({super.key});

  @override
  State<StatefulWidget> createState() => _ResultPageLiquidState();
}

class _ResultPageLiquidState extends State<ResultPageLiquid> {

  final double finalSalaryAmount = salary.salaryAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const MealPage()),
          ),
        ),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FinalCard(color: standardCardColor, cardChild: FinalCardContent(text: "Salario Liquido", value: salary.salaryAmount.toStringAsFixed(1))),
          FinalCard(color: standardCardColor, cardChild: FinalCardContent(text: "Subsidio Alimentaçao em Cartão", value: (salary.mealAmount * 22).toStringAsFixed(1))),
          const SizedBox(height: 70),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 10.0,
            width: 400.0,
          ),
          const SizedBox(height: 30),
          Container(
              margin: const EdgeInsets.only(left: 10, bottom: 20),
              decoration: BoxDecoration(
                color: selectedCardColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: 70.0,
              width: 400.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Irás receber ${(salary.salaryAmount - salary.mealAmount * 22).toStringAsFixed(1)} na conta e ${(salary.mealAmount * 22).toStringAsFixed(1)} em cartão",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8488b2),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}