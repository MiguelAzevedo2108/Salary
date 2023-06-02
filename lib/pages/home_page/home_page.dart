import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary/pages/meal_page/meal_page.dart';

import '../../cards/card.dart';
import '../../cards/card_content.dart';
import '../../entities/salary.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const selectedCardColor = Color(0xFF1D1E33);
const standardCardColor = Color(0xFF111328);

enum SalaryType{
  BRUTO,
  LIQUIDO
}

Salary salary = Salary(isGross: false, isNet: false, salaryAmount: 0.00, mealAmount: 0.00);

Salary getSalary() {
  return salary;
}

class MyHomePage extends StatefulWidget {

  final String title;

  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  SalaryType? salaryType;
  double salaryValue = 800;

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
                          salaryType = SalaryType.BRUTO;
                          salary.salaryAmount = salaryValue;
                          salary.isGross = true;
                          salary.isNet = false;
                        });
                      },
                      color: salaryType == SalaryType.BRUTO
                          ? selectedCardColor
                          : standardCardColor,
                      cardChild: CardContent(icon: FontAwesomeIcons.moneyCheckDollar, text: SalaryType.BRUTO.name),
                  ),
                ),
                Expanded(
                    child: HCard(
                      onPress: (){
                        setState(() {
                          salaryType = SalaryType.LIQUIDO;
                          salary.salaryAmount = salaryValue;
                          salary.isGross = false;
                          salary.isNet = true;
                        });
                      },
                      color: salaryType == SalaryType.LIQUIDO
                          ? selectedCardColor
                          : standardCardColor,
                      cardChild: CardContent(icon: FontAwesomeIcons.filterCircleDollar, text: SalaryType.LIQUIDO.name),
                    ),
                ),
              ],
            ),
          Slider(
              value: 800,
              min: 500,
              max: 6000,
              divisions: 5500,
              thumbColor: Colors.white,
              activeColor: bottomContainerColor,
              label: salaryValue.round().toString(),
              onChanged: (double value){
                setState(() {
                  salaryValue = value;
                  salary.salaryAmount = value;
                });
              }),
          SizedBox(
              width: 400,
              height: bottomContainerHeight,
              child: ElevatedButton(
                onPressed: (){
                  if (salary.isNet || salary.isGross){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return const MealPage();
                          }
                      ),
                    );
                  }
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

