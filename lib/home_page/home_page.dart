import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card.dart';
import 'card_content.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const selectedCardColor = Color(0xFF1D1E33);
const standardCardColor = Color(0xFF111328);

enum Salary{
  BRUTO,
  LIQUIDO
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Salary? salary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Column(
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
          SizedBox(
              width: 400,
              height: bottomContainerHeight,
              child: ElevatedButton(
                onPressed: (){},
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
