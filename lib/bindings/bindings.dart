import 'package:get/get.dart';
import 'package:my_calculator_application/controller/emi_calculator_controller.dart';
import 'package:my_calculator_application/controller/fixed_deposit_calculator_controller.dart';
import 'package:my_calculator_application/controller/loan_calculator_controller.dart';
import 'package:my_calculator_application/controller/main_menu_controller.dart';

class CalculatorBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainMenuController());
    Get.lazyPut(() => LoanCalculatorController());
    Get.lazyPut(() => EmiCalculatorController());
    Get.lazyPut(() => FixedDepositCalculatorController());
  }
  
}