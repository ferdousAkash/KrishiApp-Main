import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/consts/lists.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/wigtes/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartContrller>();
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: () {},
          color: greenColor,
          title: "Proceed to payment",
        ),
      ),
      appBar: AppBar(
        title: "Choose a payment method"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          () => Column(
              children: List.generate(paymentMethods.length, (index) {
            return GestureDetector(
              onTap: () {
                controller.ChangePaymentIndex(index);
              },
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: controller.PaymentIndex.value == index
                              ? Colors.green
                              : Colors.transparent,
                          width: 5)),
                  margin: const EdgeInsets.only(left: 45.0),
                  // margin: const EdgeInsets.only(bottom: 12.0),
                  child: Stack(
                    children: [
                      Image.asset(
                        paymentMethods[index],
                        height: 100,
                        colorBlendMode: controller.PaymentIndex.value == index
                            ? BlendMode.darken
                            : BlendMode.color,
                        color: controller.PaymentIndex.value == index
                            ? Colors.black.withOpacity(0.3)
                            : Colors.transparent,
                        fit: BoxFit.cover,
                      ),
                      controller.PaymentIndex.value == index
                          ? Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                  activeColor: greenColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  value: true,
                                  onChanged: (value) {}),
                            )
                          : Container(),
                    ],
                  )),
            );
          })),
        ),
      ),
    );
  }
}
