import '../pages/fiscal_page/fiscal_page.dart';
import '../pages/meal_page/meal_page.dart';

class Salary {

  bool isGross;
  bool isNet;
  double salaryAmount;
  double mealAmount;
  MealCardOption? hasMealCard;
  Fiscal? fiscal;
  double taxPercentage;

  Salary({required this.isGross, required this.isNet, required this.salaryAmount, this.hasMealCard, required this.mealAmount ,this.fiscal, required this.taxPercentage});

}