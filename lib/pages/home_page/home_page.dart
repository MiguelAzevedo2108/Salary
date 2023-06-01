import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary/pages/second_page/second_page.dart';

import '../../cards/card.dart';
import '../../cards/card_content.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const selectedCardColor = Color(0xFF1D1E33);
const standardCardColor = Color(0xFF111328);

enum Salary{
  BRUTO,
  LIQUIDO
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Salary? salary;
  double salaryValue = 800;
  double mealCardValue = 7.63;
  String? mealCardOption;

  List<DropdownMenuItem<String>> cardMealOptions = [
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No")
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
              children: [ // CARDS
                Expanded(
                    child: HCard(
                      onPress: (){
                        setState(() {
                          salary = Salary.BRUTO;
                        });
                      },
                      color: salary == Salary.BRUTO
                          ? selectedCardColor
                          : standardCardColor,
                      cardChild: CardContent(icon: FontAwesomeIcons.moneyCheckDollar, text: Salary.BRUTO.name),
                  ),
                ),
                Expanded(
                    child: HCard(
                      onPress: (){
                        setState(() {
                          salary = Salary.LIQUIDO;
                        });
                      },
                      color: salary == Salary.LIQUIDO
                          ? selectedCardColor
                          : standardCardColor,
                      cardChild: CardContent(icon: FontAwesomeIcons.filterCircleDollar, text: Salary.LIQUIDO.name),
                    ),
                ),
              ],
            ),
          Slider(
              value: salaryValue,
              min: 500,
              max: 6000,
              divisions: 5500,
              thumbColor: Colors.white,
              activeColor: bottomContainerColor,
              label: salaryValue.round().toString(),
              onChanged: (double value){
                setState(() {
                  salaryValue = value;
                });
              }),
          DropdownButtonFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                isDense: true),
            iconSize: 10,
            //padding: EdgeInsets.all(10),
            //borderRadius: BorderRadius.circular(5.0),
            hint:Text("Meal Card"),
            value: mealCardOption,
            items: cardMealOptions,
            onChanged: (value){
              setState(() {
                mealCardOption = value;
              });
            },
          ),
          Slider(
              value: mealCardValue,
              min: 5,
              max: 10,
              divisions: 100,
              thumbColor: Colors.white,
              activeColor: bottomContainerColor,
              label: mealCardValue.toString(),
              onChanged: (double value){
                setState(() {
                  mealCardValue = value;
                });
              }),
          SizedBox(
              width: 400,
              height: bottomContainerHeight,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return SecondPage();
                          }
                      ),
                  );
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(bottomContainerColor),
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
