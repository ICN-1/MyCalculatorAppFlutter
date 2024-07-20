import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator_application/bindings/bindings.dart';
import 'package:my_calculator_application/routes/routes.dart';
import 'package:my_calculator_application/screens/emi_calculator.dart';
import 'package:my_calculator_application/screens/fixed_deposit_calculator.dart';
import 'package:my_calculator_application/screens/loan_calculator.dart';
import 'package:my_calculator_application/screens/main_menu.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ICN Calculator',
      debugShowCheckedModeBanner: false,
      initialRoute: CalculatorRoutes.mainMenuRoute,
      initialBinding: CalculatorBindings(),
      getPages: [
        GetPage(name: CalculatorRoutes.mainMenuRoute, page: () => const MainMenu()),
        GetPage(name: CalculatorRoutes.loanCalculatorRoute, page: () => const LoanCalculator()),
        GetPage(name: CalculatorRoutes.emiCalculatorRoute, page: () => const EmiCalculator()),
        GetPage(name: CalculatorRoutes.fixedDepositCalculatorRoute, page: () => const FixedDepositCalculator())
      ],
      home: const MainMenu(),
    );
  }
}