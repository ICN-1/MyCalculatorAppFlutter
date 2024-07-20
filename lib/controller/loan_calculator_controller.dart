import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator_application/utils/formatter/numberFormatter.dart';

class LoanCalculatorController extends GetxController {
  @override
  void onInit() {
    calculateEmi();
    calculateTotalInterest();
    calculateTotalAmount();
    
    super.onInit();
  }

  final  double _minLoanValue = 1.0;
  double get minLoanValue => _minLoanValue;

  final double  _maxLoanValue = 10000000.0;
  double get maxLoanValue => _maxLoanValue;

  final RxDouble _loanAmount = 1000000.0.obs;
  double get loanAmount => _loanAmount.value;

  void onChangedLoanValue(double valueLoan){
    _loanAmount.value = valueLoan;
    calculateEmi();
    calculateTotalInterest();
    calculateTotalAmount();
  }


  final double _minInterestValue = 1.0;
  double get minInterestValue => _minInterestValue;

  final double _maxInterestValue = 100.0;
  double get maxInterestValue => _maxInterestValue;

  final RxDouble _interestAmount = 6.5.obs;
  double get interestAmount => _interestAmount.value;

  void onChangedInterestValue(double valueInterest) {
    _interestAmount.value = valueInterest;
    calculateEmi();
    calculateTotalInterest();
    calculateTotalAmount();
  }


  final double _minTenureValue = 1.0;
  double get minTenureValue => _minTenureValue;

  final double _maxTenureValue = 100.0;
  double get maxTenureValue => _maxTenureValue;

  final RxDouble _tenureAmount = 5.0.obs;
  double get tenureAmount => _tenureAmount.value;

  void onChangedTenureValue(double valueTenure) {
    _tenureAmount.value = valueTenure;
    calculateEmi();
    calculateTotalInterest();
    calculateTotalAmount();
  }


  final RxDouble _emi = 0.0.obs;
  double get emi => _emi.value;

  void calculateEmi(){
    double p = loanAmount;
    double r = (interestAmount / 12) / 100;
    double n = tenureAmount * 12;

    double emiValue = (p * r * pow((1 + r), n)) / (pow((1 + r), n) - 1);
    _emi.value = emiValue;
    calculateTotalInterest();
    calculateTotalAmount();
  }


  final RxDouble _totalInterest = 0.0.obs;
  double get totalInterest => _totalInterest.value;

  void calculateTotalInterest() {
    double totalPayments = emi * tenureAmount * 12;
    double totalInterestValue = totalPayments - loanAmount;
    _totalInterest.value = totalInterestValue;
  }


  final RxDouble _totalAmount = 0.0.obs;
  double get totalAmount => _totalAmount.value;

  void calculateTotalAmount() {
    double totalAmountValue = loanAmount + totalInterest;
    _totalAmount.value = totalAmountValue;
  }


  void showSnackBar(context){
    ScaffoldMessenger
    .of(context)
    .showSnackBar(
      SnackBar(
        content: Text(
          "Total Loan Amount: ${currencyFormat.format(totalAmount)}",
        ),
        duration: const Duration(
          seconds: 3
        ),
      )
    );
  }
}