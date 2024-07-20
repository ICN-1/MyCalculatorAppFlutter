import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator_application/utils/formatter/numberFormatter.dart';

class FixedDepositCalculatorController extends GetxController {
  @override
  void onInit() {
    updateMaturityAndInterestAmount();
    
    super.onInit();
  }
  
  final  double _minTotalAmountValue = 1.0;
  double get minTotalAmountValue => _minTotalAmountValue;

  final double  _maxTotalAmountValue = 10000000.0;
  double get maxTotalAmountValue => _maxTotalAmountValue;

  final RxDouble _totalAmount = 1000000.0.obs;
  double get totalAmount => _totalAmount.value;

  void onChangedTotalAmount(double valueTotalAmount){
    _totalAmount.value = valueTotalAmount;

    updateMaturityAndInterestAmount();
  }


  final double _minInterestValue = 1.0;
  double get minInterestValue => _minInterestValue;

  final double _maxInterestValue = 100.0;
  double get maxInterestValue => _maxInterestValue;

  final RxDouble _interest = 6.5.obs;
  double get interest => _interest.value;

  void onChangedInterestValue(double valueInterest) {
    _interest.value = valueInterest;

    updateMaturityAndInterestAmount();
  }


  final double _minTimeValue = 1.0;
  double get minTimeValue => _minTimeValue;

  final double _maxTimeValue = 100.0;
  double get maxTimeValue => _maxTimeValue;

  final RxDouble _timeValue = 5.0.obs;
  double get timeValue => _timeValue.value;

  void onChangedTimeValue(double valueTime) {
    _timeValue.value = valueTime;

    updateMaturityAndInterestAmount();
  }


  final RxDouble _interestAmount = 0.0.obs;
  double get interestAmount => _interestAmount.value;

  final RxDouble _maturityAmount = 0.0.obs;
  double get maturityAmount => _maturityAmount.value;

  void updateMaturityAndInterestAmount() {
    double p = totalAmount;
    double r = interest;
    double t = timeValue;

    double newVal = p * pow((1 + r / 100), t);
    _maturityAmount.value = newVal;

    _interestAmount.value = newVal - p;
  }


  void showSnackBar(context){
    ScaffoldMessenger
    .of(context)
    .showSnackBar(
      SnackBar(
        content: Text(
          "Fixed Deposit: ${currencyFormat.format(totalAmount)}",
        ),
        duration: const Duration(
          seconds: 3
        ),
      )
    );
  }
}