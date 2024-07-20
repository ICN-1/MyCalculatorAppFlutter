import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator_application/controller/loan_calculator_controller.dart';
import 'package:my_calculator_application/reusable_widgets/calculatedText.dart';
import 'package:my_calculator_application/reusable_widgets/calculatorSlider.dart';
import 'package:my_calculator_application/reusable_widgets/button.dart';
import 'package:my_calculator_application/utils/constants/color.dart';
import 'package:my_calculator_application/utils/constants/images.dart';
import 'package:my_calculator_application/utils/constants/sizes.dart';
import 'package:my_calculator_application/utils/constants/text.dart';
import 'package:my_calculator_application/utils/device/device_utils.dart';
import 'package:my_calculator_application/utils/formatter/numberFormatter.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({super.key});

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  @override
  Widget build(BuildContext context) {
    LoanCalculatorController loanCalculatorController = Get.put(LoanCalculatorController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: DeviceUtils.getStatusBarHeight(context) + 30.0, bottom: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage(
                        CalculatorImages.elctroIcon,
                      ),
                      height: 40,
                      width: 40,
                    ),
                        
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        appName,
                        style: TextStyle(
                          color: CalculatorColors.blueMedium2,
                          fontWeight: FontWeight.bold,
                          fontSize: CalculatorSizes.largeText
                        ),
                      ),
                    )
                  ],
                ),
              ),
          
              const Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Loan Calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CalculatorColors.black,
                      fontSize: CalculatorSizes.largeText,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CalculatedText(
                          text: "Loan Amount", 
                          txtColor: CalculatorColors.black, 
                          backgroundColor: CalculatorColors.white, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal
                        ),

                        Obx(() => CalculatedText(
                          text: currencyFormat.format(loanCalculatorController.loanAmount), 
                          txtColor: CalculatorColors.blueMedium, 
                          backgroundColor: CalculatorColors.blueLight,
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.bold,
                        ))
                      ],
                    ),

                    Obx(() => CalculatorSlider(
                      value: loanCalculatorController.loanAmount, 
                      min: loanCalculatorController.minLoanValue, 
                      max: loanCalculatorController.maxLoanValue, 
                      activeColor: CalculatorColors.blueMedium, 
                      onChanged: (valueLoan) => loanCalculatorController.onChangedLoanValue(valueLoan),
                    )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CalculatedText(
                          text: "Rate of interest (p.a)", 
                          txtColor: CalculatorColors.black, 
                          backgroundColor: CalculatorColors.white, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal
                        ),

                        Obx(() => CalculatedText(
                          text: "${loanCalculatorController.interestAmount.toStringAsFixed(1)}%", 
                          txtColor: CalculatorColors.blueMedium, 
                          backgroundColor: CalculatorColors.blueLight,
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.bold,
                        ))
                      ],
                    ),

                    Obx(() => CalculatorSlider( 
                      value: loanCalculatorController.interestAmount, 
                      min: loanCalculatorController.minInterestValue, 
                      max: loanCalculatorController.maxInterestValue, 
                      activeColor: CalculatorColors.blueMedium, 
                      onChanged: (valueInterest) => loanCalculatorController.onChangedInterestValue(valueInterest)
                    ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CalculatedText(
                          text: "Loan Tenure", 
                          txtColor: CalculatorColors.black, 
                          backgroundColor: CalculatorColors.white, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal
                        ),

                        Obx(() => CalculatedText(
                          text: "${loanCalculatorController.tenureAmount.round()} Yr", 
                          txtColor: CalculatorColors.blueMedium, 
                          backgroundColor: CalculatorColors.blueLight, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.bold,
                        ))
                      ],
                    ),

                    Obx(() => CalculatorSlider(
                      value: loanCalculatorController.tenureAmount, 
                      min: loanCalculatorController.minTenureValue, 
                      max: loanCalculatorController.maxTenureValue, 
                      activeColor: CalculatorColors.blueMedium, 
                      onChanged: (valueTenure) => loanCalculatorController.onChangedTenureValue(valueTenure)
                    ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CalculatedText(
                      text: "Monthly EMI", 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.normal
                    ),

                    Obx(() => CalculatedText(
                      text: currencyFormat.format(loanCalculatorController.emi), 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.bold
                    ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CalculatedText(
                      text: "Principal Amount", 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.normal
                    ),

                    Obx(() => CalculatedText(
                      text: currencyFormat.format(loanCalculatorController.loanAmount), 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.bold
                    ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CalculatedText(
                      text: "Total interest", 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.normal
                    ),

                    Obx(() => CalculatedText(
                      text: currencyFormat.format(loanCalculatorController.totalInterest), 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.bold
                    ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CalculatedText(
                      text: "Total amount", 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.normal
                    ),

                    Obx(() => CalculatedText(
                      text: currencyFormat.format(loanCalculatorController.totalAmount), 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.bold
                    ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      icon: Icons.share,
                      iconColor: CalculatorColors.white,
                      backgroundColor: CalculatorColors.blueGreen, 
                      buttonTxt: 'SHARE', 
                      textColor: CalculatorColors.white, 
                      onPressed: () {  },
                      top: 10.0,
                      left: 5.0,
                      bottom: 10.0,
                      right: 5.0,
                    ),

                    Button(
                      backgroundColor: CalculatorColors.blueGreen, 
                      buttonTxt: 'Save as PDF', 
                      textColor: CalculatorColors.white, 
                      onPressed: () {  },
                      top: 10.0,
                      left: 5.0,
                      bottom: 10.0,
                      right: 5.0,
                    )
                  ],
                )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Button(
                  buttonTxt: "Total Loan Amount", 
                  textColor: CalculatorColors.white, 
                  backgroundColor: CalculatorColors.blueGreen, 
                  onPressed: () => loanCalculatorController.showSnackBar(context), 
                  top: 20, 
                  left: 50, 
                  bottom: 20, 
                  right: 50
                ),
              )
            ]
          )
        )
      )
    );
  }
}