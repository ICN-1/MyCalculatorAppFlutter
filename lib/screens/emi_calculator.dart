import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator_application/controller/emi_calculator_controller.dart';
import 'package:my_calculator_application/reusable_widgets/button.dart';
import 'package:my_calculator_application/reusable_widgets/calculatedText.dart';
import 'package:my_calculator_application/reusable_widgets/calculatorSlider.dart';
import 'package:my_calculator_application/utils/constants/color.dart';
import 'package:my_calculator_application/utils/constants/images.dart';
import 'package:my_calculator_application/utils/constants/sizes.dart';
import 'package:my_calculator_application/utils/constants/text.dart';
import 'package:my_calculator_application/utils/device/device_utils.dart';
import 'package:my_calculator_application/utils/formatter/numberFormatter.dart';

class EmiCalculator extends StatefulWidget {
  const EmiCalculator({super.key});

  @override
  State<EmiCalculator> createState() => _EmiCalculatorState();
}

class _EmiCalculatorState extends State<EmiCalculator> {
  @override
  Widget build(BuildContext context) {
    EmiCalculatorController emiCalculatorController = Get.put(EmiCalculatorController());

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
                    "EMI Calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CalculatorColors.black,
                      fontSize: CalculatorSizes.largeText,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: CalculatorColors.blueLight,
                  ),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CalculatedText(
                            text: "Monthly payable EMI", 
                            txtColor: CalculatorColors.blueGreen, 
                            backgroundColor: CalculatorColors.blueLight, 
                            fontSize: CalculatorSizes.normalText, 
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Obx(() => CalculatedText(
                            text: currencyFormat.format(emiCalculatorController.emi), 
                            txtColor: CalculatorColors.blueGreen, 
                            backgroundColor: CalculatorColors.blueLight, 
                            fontSize: CalculatorSizes.veryLargeText, 
                            fontWeight: FontWeight.bold
                          )),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 40.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Obx(() => CalculatedText(
                            text: "Total payable for ${emiCalculatorController.term.round()} years ${currencyFormat.format(emiCalculatorController.totalPayable.round())}", 
                            txtColor: CalculatorColors.blueGreen, 
                            backgroundColor: CalculatorColors.blueLight, 
                            fontSize: CalculatorSizes.smallText, 
                            fontWeight: FontWeight.normal
                          ),)
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: CalculatorColors.mildGrey,
                  ),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CalculatedText(
                              text: "Total Interest Payable", 
                              txtColor: CalculatorColors.black, 
                              backgroundColor: CalculatorColors.mildGrey, 
                              fontSize: CalculatorSizes.smallText, 
                              fontWeight: FontWeight.normal
                            ),

                            Obx(() =>CalculatedText(
                              text: currencyFormat.format(emiCalculatorController.totalInterestPayable.round()), 
                              txtColor: CalculatorColors.black, 
                              backgroundColor: CalculatorColors.mildGrey, 
                              fontSize: CalculatorSizes.smallText, 
                              fontWeight: FontWeight.bold
                            )),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CalculatedText(
                              text: "Total Payment", 
                              txtColor: CalculatorColors.black, 
                              backgroundColor: CalculatorColors.mildGrey, 
                              fontSize: CalculatorSizes.smallText, 
                              fontWeight: FontWeight.normal
                            ),

                            Obx(() => CalculatedText(
                              text: currencyFormat.format(emiCalculatorController.loanRequirement.round()), 
                              txtColor: CalculatorColors.black, 
                              backgroundColor: CalculatorColors.mildGrey, 
                              fontSize: CalculatorSizes.smallText, 
                              fontWeight: FontWeight.bold
                            )),
                          ]
                        ),
                      )
                    ],
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
                          text: "Loan Amount Required", 
                          txtColor: CalculatorColors.black, 
                          backgroundColor: CalculatorColors.white, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal
                        ),

                        Obx(() => CalculatedText(
                          text: currencyFormat.format(emiCalculatorController.loanRequirement.round()), 
                          txtColor: CalculatorColors.blueMedium, 
                          backgroundColor: CalculatorColors.blueLight,
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal,
                        ))
                      ],
                    ),

                    Obx(() => CalculatorSlider(
                      value: emiCalculatorController.loanRequirement, 
                      min: emiCalculatorController.minLoanRequirement, 
                      max: emiCalculatorController.maxLoanRequirement, 
                      activeColor: CalculatorColors.blueMedium, 
                      onChanged: (valueLR) => (emiCalculatorController.onChangedLoanRequirement(valueLR)),
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
                          text: "Repayment Term", 
                          txtColor: CalculatorColors.black, 
                          backgroundColor: CalculatorColors.white, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal
                        ),

                        Obx(() => CalculatedText(
                          text: "${emiCalculatorController.term.round()} Years", 
                          txtColor: CalculatorColors.blueMedium, 
                          backgroundColor: CalculatorColors.blueLight,
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal,
                        ))
                      ],
                    ),

                    Obx(() => CalculatorSlider(
                      value: emiCalculatorController.term, 
                      min: emiCalculatorController.minTerm, 
                      max: emiCalculatorController.maxTerm, 
                      activeColor: CalculatorColors.blueMedium, 
                      onChanged: (valueT) => (emiCalculatorController.onChangedTerm(valueT)),
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
                          text: "Interest Rate", 
                          txtColor: CalculatorColors.black, 
                          backgroundColor: CalculatorColors.white, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal
                        ),

                        Obx(() => CalculatedText(
                          text: "${emiCalculatorController.rate.round()}%", 
                          txtColor: CalculatorColors.blueMedium, 
                          backgroundColor: CalculatorColors.blueLight,
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal,
                        ))
                      ],
                    ),

                    Obx(() => CalculatorSlider(
                      value: emiCalculatorController.rate, 
                      min: emiCalculatorController.minRate, 
                      max: emiCalculatorController.maxRate,
                      activeColor: CalculatorColors.blueMedium, 
                      onChanged: (valueR) => (emiCalculatorController.onChangedRate(valueR)),
                    )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Button(
                  buttonTxt: "Monthly Payable EMI", 
                  textColor: CalculatorColors.white, 
                  backgroundColor: CalculatorColors.blueGreen, 
                  onPressed: () => emiCalculatorController.showSnackBar(context), 
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