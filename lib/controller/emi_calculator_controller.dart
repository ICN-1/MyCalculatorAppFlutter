import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator_application/utils/formatter/numberFormatter.dart';

class EmiCalculatorController extends GetxController{
  @override
  void onInit() {
    calculateEmi();
    calculateTotalInterestPayable();
    updateTotalPayable();
  
    super.onInit();
  }

  final double _minLoanRequirement = 1.0;
  double get minLoanRequirement => _minLoanRequirement;

  final double _maxLoanRequirement = 1000000.0;
  double get maxLoanRequirement => _maxLoanRequirement;

  final RxDouble _loanRequirement = 500000.0.obs;
  double get loanRequirement => _loanRequirement.value;

  void onChangedLoanRequirement(double valueLR){
    _loanRequirement.value = valueLR;

    calculateEmi();
    calculateTotalInterestPayable();
    updateTotalPayable();
  }


  final double _minTerm = 1.0;
  double get minTerm => _minTerm;

  final double _maxTerm = 50.0;
  double get maxTerm => _maxTerm;

  final RxDouble _term = 25.0.obs;
  double get term => _term.value;

  void onChangedTerm(double valueT){
    _term.value = valueT;

    calculateEmi();
    calculateTotalInterestPayable();
    updateTotalPayable();
  }


  final double _minRate = 1.0;
  double get minRate => _minRate;

  final double _maxRate = 100.0;
  double get maxRate => _maxRate;

  final RxDouble _rate = 9.0.obs;
  double get rate => _rate.value;

  void onChangedRate(double valueR){
    _rate.value = valueR;

    calculateEmi();
    calculateTotalInterestPayable();
    updateTotalPayable();
  }


  final RxDouble _emi = 0.0.obs;
  double get emi => _emi.value;

  void calculateEmi() {
    double p = loanRequirement;
    double r = (rate / 12) / 100;
    double n = term * 12;

    double emiValue = (p * r * pow((1 + r), n)) / (pow((1 + r), n) - 1);
    _emi.value = emiValue;
  }


  final RxDouble _totalInterestPayable = 0.0.obs;
  double get totalInterestPayable => _totalInterestPayable.value;

  void calculateTotalInterestPayable(){
    double n = term * 12;
    double totalPay = emi * n;

    double result = totalPay - loanRequirement;
    _totalInterestPayable.value = result;
  }


  final RxDouble _totalPayable = 0.0.obs;
  double get totalPayable => _totalPayable.value;

  void updateTotalPayable(){
    _totalPayable.value = loanRequirement + totalInterestPayable;
  }


  void showSnackBar(context){
    ScaffoldMessenger
    .of(context)
    .showSnackBar(
      SnackBar(
        content: Text(
          "Monthly Payable EMI: ${currencyFormat.format(emi)}",
        ),
        duration: const Duration(
          seconds: 3
        ),
      )
    );
  }
}