import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/services/firestore_services.dart';
import 'package:flutter_application_1/views/cart_screen/shiping_screen.dart';
import 'package:flutter_application_1/wigtes/loading_indicator.dart';
import 'package:flutter_application_1/wigtes/our_button.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartContrller());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 50,
        width: context.screenWidth - 0,
        child: ourButton(
            color: Colors.green,
            onPress: () {
              Get.to(() => const ShippingDetails());
            },
            textColor: whiteColor,
            title: "Proceed to Shipment"),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Cart is Empty!"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .makeCentered(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "Cart is empty".text.color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            controller.calculate(data);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset(imgP6),
                            title: "${data[index]['title']}"
                                .text
                                .fontFamily(semibold)
                                .size(16)
                                .make(),
                            subtitle: "${data[index]['tprice']}"
                                .text
                                .fontFamily(semibold)
                                .color(red)
                                .size(16)
                                .make(),
                            trailing: Icon(
                              Icons.delete,
                              color: red,
                            ).onTap(() {
                              FirestoreServices.deleteDocument(data[index].id);
                            }),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Total price"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      Obx(() => "${controller.totalP.value}"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make()),
                    ],
                  )
                      .box
                      .padding(EdgeInsets.all(12))
                      .color(golden)
                      .roundedSM
                      .make(),
                  // SizedBox(
                  //   width: context.screenWidth - 0,
                  //   child: ourButton(
                  //       color: Colors.green,
                  //       onPress: () {},
                  //       textColor: whiteColor,
                  //       title: "Proceed to Shipment"),
                  // )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
