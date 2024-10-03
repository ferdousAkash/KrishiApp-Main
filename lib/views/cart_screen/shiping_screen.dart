import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/views/cart_screen/payment_screen.dart';
import 'package:flutter_application_1/wigtes/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../wigtes/custom_textfields.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartContrller>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Information"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: () {
            if (controller.AddressController.text.length > 10) {
              Get.to(() => const PaymentMethods());
            } else {
              VxToast.show(context, msg: "Please fill the form");
            }
          },
          color: greenColor,
          title: "Continue",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customtextfield(
                hint: "Address",
                isPass: false,
                title: "Address",
                controller: controller.AddressController),
            customtextfield(
                hint: "City",
                isPass: false,
                title: "City",
                controller: controller.CityController),
            customtextfield(
                hint: "State",
                isPass: false,
                title: "State",
                controller: controller.StateController),
            customtextfield(
                hint: "Postal Code",
                isPass: false,
                title: "Postal Code",
                controller: controller.PostalController),
            customtextfield(
                hint: "Phone",
                isPass: false,
                title: "Phone",
                controller: controller.PhoneController),
          ],
        ),
      ),
    );
  }
}
