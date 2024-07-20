import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator_application/controller/main_menu_controller.dart';
import 'package:my_calculator_application/reusable_widgets/card.dart';
import 'package:my_calculator_application/utils/constants/color.dart';
import 'package:my_calculator_application/utils/constants/images.dart';
import 'package:my_calculator_application/utils/constants/sizes.dart';
import 'package:my_calculator_application/utils/constants/text.dart';
import 'package:my_calculator_application/utils/device/device_utils.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final mainMenuController = Get.put(MainMenuController());

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
                    "Popular Calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CalculatorColors.black,
                      fontSize: CalculatorSizes.largeText,
                    ),
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CalculatorCard(
                          cardText: 'SIP Calculator', 
                          imageText: CalculatorImages.systematicInvestmentPlanIcon,
                        ),
                    
                        CalculatorCard(
                          cardText: 'Loan Calculator', 
                          imageText: CalculatorImages.loanIcon,
                          onTap: () => mainMenuController.goToLoanCalculatorScreen(),
                        ),
                    
                        const CalculatorCard(
                          cardText: 'SWP Calculator', 
                          imageText: CalculatorImages.systematicWithdrawalPlanIcon
                        )
                      ],
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorCard(
                            cardText: 'FD Calculator', 
                            imageText: CalculatorImages.fixedDepositIcon,
                            onTap: () => mainMenuController.goToFixedDepositCalculatorScreen(),
                          ),
                      
                          const CalculatorCard(
                            cardText: 'RD Calculator', 
                            imageText: CalculatorImages.recurringDepositIcon
                          ),
                      
                          CalculatorCard(
                            cardText: 'EMI Calculator', 
                            imageText: CalculatorImages.equatedMonthlyInstallmentsIcon,
                            onTap: () => mainMenuController.goToEMICalculatorScreen(),
                          )
                        ],
                      ),
                    ),
          
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorCard(
                            cardText: 'EPF Calculator', 
                            imageText: CalculatorImages.employeesProvidentFundIcon
                          ),
                      
                          CalculatorCard(
                            cardText: 'Income Tax Calculator', 
                            imageText: CalculatorImages.incomeTaxIcon
                          ),
                      
                          CalculatorCard(
                            cardText: 'PPF Calculator', 
                            imageText: CalculatorImages.publicProvidentFundIcon
                          )
                        ],
                      ),
                    ),
          
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorCard(
                            cardText: 'GST Calculator', 
                            imageText: CalculatorImages.goodsAndServicesTaxIcon
                          ),
                      
                          CalculatorCard(
                            cardText: 'Mutual Fund Return Calculator', 
                            imageText: CalculatorImages.mutualFundReturnIcon
                          ),
                      
                          CalculatorCard(
                            cardText: 'Sukanya Samridhhi Yojana Calculator', 
                            imageText: CalculatorImages.sukanyaSamridhhiSchemeIcon
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}