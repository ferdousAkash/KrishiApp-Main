import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CartContrller extends GetxController {
//text controller for shipping details
  var AddressController = TextEditingController();
  var CityController = TextEditingController();
  var StateController = TextEditingController();
  var PostalController = TextEditingController();
  var PhoneController = TextEditingController();
  var PaymentIndex = 0.obs;

  var totalP = 0.obs;
  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

  ChangePaymentIndex(index) {
    PaymentIndex.value = index;
  }
}
