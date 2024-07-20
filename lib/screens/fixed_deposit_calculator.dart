import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_calculator_application/controller/fixed_deposit_calculator_controller.dart';
import 'package:my_calculator_application/reusable_widgets/button.dart';
import 'package:my_calculator_application/reusable_widgets/calculatedText.dart';
import 'package:my_calculator_application/reusable_widgets/calculatorSlider.dart';
import 'package:my_calculator_application/utils/constants/color.dart';
import 'package:my_calculator_application/utils/constants/images.dart';
import 'package:my_calculator_application/utils/constants/sizes.dart';
import 'package:my_calculator_application/utils/constants/text.dart';
import 'package:my_calculator_application/utils/device/device_utils.dart';
import 'package:my_calculator_application/utils/formatter/numberFormatter.dart';

class FixedDepositCalculator extends StatefulWidget {
  const FixedDepositCalculator({super.key});

  @override
  State<FixedDepositCalculator> createState() => _FixedDepositCalculatorState();
}

class _FixedDepositCalculatorState extends State<FixedDepositCalculator> {
  @override
  Widget build(BuildContext context) {
    FixedDepositCalculatorController fixedDepositCalculatorController = Get.put(FixedDepositCalculatorController());

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
                    "Fixed Deposit Calculator",
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
                            text: "Fixed Deposit", 
                            txtColor: CalculatorColors.blueGreen, 
                            backgroundColor: CalculatorColors.blueLight, 
                            fontSize: CalculatorSizes.normalText, 
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 40.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Obx(() => CalculatedText(
                            text: currencyFormat.format(fixedDepositCalculatorController.totalAmount),
                            txtColor: CalculatorColors.blueGreen, 
                            backgroundColor: CalculatorColors.blueLight, 
                            fontSize: CalculatorSizes.veryLargeText, 
                            fontWeight: FontWeight.bold
                          )),
                        ),
                      ),
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
                          text: "Total Amount", 
                          txtColor: CalculatorColors.black, 
                          backgroundColor: CalculatorColors.white, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal
                        ),

                        Obx(() => CalculatedText(
                          text: currencyFormat.format(fixedDepositCalculatorController.totalAmount), 
                          txtColor: CalculatorColors.blueMedium, 
                          backgroundColor: CalculatorColors.blueLight,
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.bold,
                        ))
                      ],
                    ),

                    Obx(() => CalculatorSlider(
                      value: fixedDepositCalculatorController.totalAmount, 
                      min: fixedDepositCalculatorController.minTotalAmountValue, 
                      max: fixedDepositCalculatorController.maxTotalAmountValue, 
                      activeColor: CalculatorColors.blueMedium, 
                      onChanged: (valueLoan) => fixedDepositCalculatorController.onChangedTotalAmount(valueLoan),
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
                          text: "${fixedDepositCalculatorController.interest.toStringAsFixed(1)}%", 
                          txtColor: CalculatorColors.blueMedium, 
                          backgroundColor: CalculatorColors.blueLight,
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.bold,
                        ))
                      ],
                    ),

                    Obx(() => CalculatorSlider( 
                      value: fixedDepositCalculatorController.interest, 
                      min: fixedDepositCalculatorController.minInterestValue, 
                      max: fixedDepositCalculatorController.maxInterestValue, 
                      activeColor: CalculatorColors.blueMedium, 
                      onChanged: (valueInterest) => fixedDepositCalculatorController.onChangedInterestValue(valueInterest)
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
                          text: "Time Period", 
                          txtColor: CalculatorColors.black, 
                          backgroundColor: CalculatorColors.white, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.normal
                        ),

                        Obx(() => CalculatedText(
                          text: "${fixedDepositCalculatorController.timeValue.round()} Yr", 
                          txtColor: CalculatorColors.blueMedium, 
                          backgroundColor: CalculatorColors.blueLight, 
                          fontSize: CalculatorSizes.normalText, 
                          fontWeight: FontWeight.bold,
                        ))
                      ],
                    ),

                    Obx(() => CalculatorSlider(
                      value: fixedDepositCalculatorController.timeValue, 
                      min: fixedDepositCalculatorController.minTimeValue, 
                      max: fixedDepositCalculatorController.maxTimeValue, 
                      activeColor: CalculatorColors.blueMedium, 
                      onChanged: (valueTime) => fixedDepositCalculatorController.onChangedTimeValue(valueTime)
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
                      text: "Maturity Amount", 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.normal
                    ),

                    Obx(() => CalculatedText(
                      text: currencyFormat.format(fixedDepositCalculatorController.maturityAmount), 
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
                      text: "Interest Amount", 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.normal
                    ),

                    Obx(() => CalculatedText(
                      text: currencyFormat.format(fixedDepositCalculatorController.interestAmount), 
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
                      text: "Fixed Deposit", 
                      txtColor: CalculatorColors.black, 
                      backgroundColor: CalculatorColors.white, 
                      fontSize: CalculatorSizes.normalText, 
                      fontWeight: FontWeight.normal
                    ),

                    Obx(() => CalculatedText(
                      text: currencyFormat.format(fixedDepositCalculatorController.totalAmount), 
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
                child: Button(
                  buttonTxt: "Fixed Deposit", 
                  textColor: CalculatorColors.white, 
                  backgroundColor: CalculatorColors.blueGreen, 
                  onPressed: () => fixedDepositCalculatorController.showSnackBar(context), 
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