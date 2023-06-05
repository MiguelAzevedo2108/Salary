import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cards/card.dart';
import '../../cards/card_content.dart';
import '../../cards/yes_no_card.dart';
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

  double mealValue = 7.63;
  MealCardOption? yesNoOption;

  List<DropdownMenuItem<String>> cardMealOptions = [
    const DropdownMenuItem(value: "Yes", child: Text("Yes")),
    const DropdownMenuItem(value: "No", child: Text("No"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const MyHomePage(title: 'Salary')),
          ),
        ),
        backgroundColor: const Color(0xFF0A0E21),
      ),
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
                    text: 'Meal Card',
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
              value: mealValue,
              min: 5,
              max: 10,
              divisions: 100,
              thumbColor: Colors.white,
              activeColor: bottomContainerColor,
              label: mealValue.toString(),
              onChanged: (double value) {
                setState(() {
                  mealValue = value;
                });
              }),
          SizedBox(
            width: 400,
            height: bottomContainerHeight,
            child: ElevatedButton(
              onPressed: () {
                if (yesNoOption != null) {
                  salary.mealAmount = mealValue;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const FiscalPage()));
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
