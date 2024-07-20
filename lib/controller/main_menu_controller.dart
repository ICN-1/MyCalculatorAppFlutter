import 'package:get/get.dart';
import 'package:my_calculator_application/routes/routes.dart';

class MainMenuController extends GetxController {
  void goToLoanCalculatorScreen(){
    Get.toNamed(
      CalculatorRoutes.loanCalculatorRoute
    );
  }

  void goToEMICalculatorScreen(){
    Get.toNamed(
      CalculatorRoutes.emiCalculatorRoute
    );
  }

  void goToFixedDepositCalculatorScreen(){
    Get.toNamed(
      CalculatorRoutes.fixedDepositCalculatorRoute
    );
  }
}