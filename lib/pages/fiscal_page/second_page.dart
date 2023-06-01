import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary/cards/card.dart';
import 'package:salary/cards/card_content.dart';

import '../home_page/home_page.dart';

enum Fiscal{
  AZORES,
  CONTINENTE
}

class SecondPage extends StatefulWidget{
  const SecondPage({super.key});

  @override
  State<StatefulWidget> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  Fiscal? fiscal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      });
                    },
                    color: fiscal == Fiscal.AZORES
                          ? selectedCardColor
                          : standardCardColor,
                    cardChild: CardContent(
                      icon: FontAwesomeIcons.a,
                      text: Fiscal.AZORES.name,
                    ),
                  ),
              ),
              Expanded(
                child: HCard(
                  onPress: () {
                    setState(() {
                      fiscal = Fiscal.CONTINENTE;
                    });
                  },
                  color: fiscal == Fiscal.CONTINENTE
                        ? selectedCardColor
                        : standardCardColor,
                  cardChild: CardContent(
                    icon: FontAwesomeIcons.c,
                    text: Fiscal.CONTINENTE.name,
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
                /*Navigator.push(
                    context, 
                    MaterialPageRoute(
                        builder: (context){
                       return const MyHomePage(title: "Salary");
                    },
                  ),
                );*/
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(bottomContainerColor),
              ),
              child: Text(
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
