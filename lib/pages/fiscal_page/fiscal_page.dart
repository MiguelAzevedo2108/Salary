import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary/pages/meal_page/meal_page.dart';
import 'package:salary/pages/result_page/result_page_one.dart';

import '../../cards/card.dart';
import '../../cards/card_content.dart';
import '../home_page/home_page.dart';
import '../result_page/result_page_two.dart';

enum Fiscal { AZORES, CONTINENTE }

Map<int, double> azoresTable = {
  798: 0.00,
  855: 2.30,
  964: 7.00,
  1051: 7.80,
  1113: 8.40,
  1194: 9.10,
  1280: 9.80,
  1380: 10.60,
  1466: 11.30,
  1609: 12.00,
  1762: 13.00,
  1925: 13.90,
  2035: 14.60,
  2151: 15.30,
  2283: 16.00,
  2437: 16.70,
  2609: 17.40,
  2848: 18.10,
  3195: 18.90,
  3637: 20.00,
  4239: 20.80,
  4786: 22.00,
  5346: 22.60,
  6052: 23.30,
  6924: 24.70,
  8171: 25.40,
  9840: 26.70,
  11612: 27.40,
  19404: 28.10,
  20811: 28.80,
  23413: 29.30,
  26014: 30.00,
  26015: 30.70
};
Map<int, double> continenteTable = {
  762: 0.00,
  790: 2.00,
  812: 4.00,
  863: 7.00,
  964: 9.30,
  1051: 11.20,
  1113: 12.00,
  1194: 13.00,
  1280: 14.00,
  1380: 15.10,
  1466: 16.20,
  1609: 17.20,
  1762: 18.60,
  1925: 19.90,
  2035: 20.90,
  2151: 21.90,
  2283: 22.80,
  2437: 23.80,
  2609: 24.80,
  2848: 25.80,
  3195: 27.00,
  3637: 28.60,
  4239: 29.70,
  4786: 31.40,
  5346: 32.30,
  6052: 33.30,
  6924: 35.30,
  8171: 36.30,
  9840: 38.20,
  11612: 39.20,
  19404: 40.20,
  20811: 41.20,
  23413: 41.90,
  26014: 42.90,
  26015: 43.80
};

double findNearestTax(Map<int, double> irsTable, double salary) {
  for (MapEntry<int, double> entry in irsTable.entries) {
    if (irsTable.containsKey(salary)) {
      return entry.value / 100;
    }
    else if (entry.key > salary) {
      return entry.value / 100;
    }
  }
  return irsTable.values.last / 100;
}

class FiscalPage extends StatefulWidget {
  const FiscalPage({super.key});

  @override
  State<StatefulWidget> createState() => _FiscalPageState();
}

class _FiscalPageState extends State<FiscalPage> {
  Fiscal? fiscal;

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                child: HCard(
                  onPress: () {
                    setState(() {
                      fiscal = Fiscal.AZORES;
                      salary.fiscal = Fiscal.AZORES;
                        if (salary.hasMealCard == MealCardOption.Yes) {
                          salary.taxPercentage =
                            findNearestTax(azoresTable, (salary.salaryAmount - salary.mealAmount * 22)) * 100;
                        } else {
                          salary.taxPercentage =
                            findNearestTax(azoresTable, salary.salaryAmount) * 100;
                        }
                    });
                  },
                  color: fiscal == Fiscal.AZORES
                      ? selectedCardColor
                      : standardCardColor,
                  cardChild: CardContent(
                    icon: FontAwesomeIcons.a,
                    text: "Açores",
                  ),
                ),
              ),
              Expanded(
                child: HCard(
                  onPress: () {
                    setState(() {
                      fiscal = Fiscal.CONTINENTE;
                      salary.fiscal = Fiscal.CONTINENTE;
                       if (salary.hasMealCard == MealCardOption.Yes) {
                        salary.taxPercentage =
                            findNearestTax(continenteTable, (salary.salaryAmount - salary.mealAmount * 22)) * 100;
                       } else {
                        salary.taxPercentage =
                            findNearestTax(continenteTable, salary.salaryAmount) * 100;
                      }
                    });
                  },
                  color: fiscal == Fiscal.CONTINENTE
                      ? selectedCardColor
                      : standardCardColor,
                  cardChild: CardContent(
                    icon: FontAwesomeIcons.c,
                    text: "Continente",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 400,
            height: bottomContainerHeight,
            child: ElevatedButton(
              onPressed: () {
                 if (fiscal != null &&
                    salary.hasMealCard == MealCardOption.Yes) {

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ResultPageOne()));
                }
                else if (fiscal != null &&
                    salary.hasMealCard == MealCardOption.No) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ResultPageTwo()));
                }
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(bottomContainerColor),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void printSalary() {
    if (kDebugMode) {
      print("Salary - ${salary.salaryAmount}\n"
        "Net - ${salary.isNet}\n"
        "Gross - ${salary.isGross}\n"
        "MealCard - ${salary.hasMealCard}\n"
        "MealAllowence - ${salary.mealAmount}\n"
        "Tax percentage - ${salary.taxPercentage}");
    }
  }
}
