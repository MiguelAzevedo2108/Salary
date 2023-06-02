import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary/cards/card.dart';
import 'package:salary/cards/card_content.dart';
import 'package:salary/cards/yes_no_card.dart';

import '../fiscal_page/fiscal_page.dart';
import '../home_page/home_page.dart';

enum MealCardOption{
  Yes,
  No
}

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {

  double mealCardValue = 7.63;
  String? mealCardOption;
  MealCardOption? yesNoOption;

  List<DropdownMenuItem<String>> cardMealOptions = [
    const DropdownMenuItem(value: "Yes", child: Text("Yes")),
    const DropdownMenuItem(value: "No", child: Text("No"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HCard(
                  color: standardCardColor,
                  cardChild: CardContent(
                    icon: FontAwesomeIcons.addressCard,
                    text: 'Meal Allowance',
                  ),
                  onPress: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  YesNoCard(
                    onPress: () {
                      setState(() {
                        yesNoOption = MealCardOption.Yes;
                        salary.hasMealCard = MealCardOption.Yes;
                        salary.mealAmount = mealCardValue;
                      });
                    },
                    color: yesNoOption == MealCardOption.Yes
                        ? selectedCardColor
                        : standardCardColor,
                    cardChild: const Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  YesNoCard(
                    onPress: () {
                      setState(() {
                        yesNoOption = MealCardOption.No;
                        salary.hasMealCard = MealCardOption.No;
                        salary.mealAmount = 0;
                      });
                    },
                    color: yesNoOption == MealCardOption.No
                        ? selectedCardColor
                        : standardCardColor,
                    cardChild: const Center(
                      child: Text(
                        "No",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Slider(
              value: mealCardValue,
              min: 5,
              max: 10,
              divisions: 100,
              thumbColor: Colors.white,
              activeColor: bottomContainerColor,
              label: mealCardValue.toString(),
              onChanged: (double value) {
                setState(() {
                  mealCardValue = value;
                  salary.mealAmount = value;
                });
              }),
          SizedBox(
            width: 400,
            height: bottomContainerHeight,
            child: ElevatedButton(
              onPressed: () {
                if (salary.hasMealCard != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FiscalPage()));
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
}
