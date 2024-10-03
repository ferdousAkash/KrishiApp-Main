import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/consts/lists.dart';
import 'package:flutter_application_1/consts/styles.dart';
import 'package:flutter_application_1/controller/product_controller.dart';
import 'package:flutter_application_1/wigtes/our_button.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    //print(Colors.green.value);
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.resetValues();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: darkFontGrey,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: darkFontGrey,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //swiper section

                        VxSwiper.builder(
                            autoPlay: true,
                            height: 350,
                            itemCount: data['p_imgs'].length,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1.0,
                            itemBuilder: (context, index) {
                              return Image.asset(
                                imgP6,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            }),

                        10.heightBox,
                        //title and details

                        title!.text
                            .size(16)
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make(),
                        10.heightBox,
                        //ratingV
                        VxRating(
                          isSelectable: true,
                          value: double.parse(data['p_rating']),
                          onRatingUpdate: (value) {},
                          normalColor: textfieldGrey,
                          selectionColor: golden,
                          count: 5,
                          //stepInt: true,
                          size: 25,
                          maxRating: 5,
                        ),

                        10.heightBox,
                        "${data['p_price']}"
                            .numCurrency
                            .text
                            .color(Color.fromARGB(255, 244, 141, 24))
                            .fontFamily(bold)
                            .size(18)
                            .make(),

                        10.heightBox,

                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Seller".text.white.fontFamily(semibold).make(),
                                5.heightBox,
                                "${data['p_seller']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                              ],
                            )),
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.message_rounded,
                                  color: darkFontGrey),
                            ),
                          ],
                        )
                            .box
                            .height(60)
                            .padding(const EdgeInsets.symmetric(horizontal: 16))
                            .color(textfieldGrey)
                            .make(),

                        //color section
                        20.heightBox,
                        Obx(
                          () => Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: "Color: "
                                        .text
                                        .color(textfieldGrey)
                                        .make(),
                                  ),
                                  Row(
                                    children: List.generate(
                                        data['p_colors'].length,
                                        (index) => Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                VxBox()
                                                    .size(40, 40)
                                                    .roundedFull
                                                    .color(Color(
                                                            data['p_colors']
                                                                [index])
                                                        .withOpacity(0.8))
                                                    .margin(const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4))
                                                    .make()
                                                    .onTap(() {
                                                  controller
                                                      .changeColorIndex(index);
                                                }),
                                                Visibility(
                                                  visible: index ==
                                                      controller
                                                          .colorIndex.value,
                                                  child: const Icon(Icons.done,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )),
                                  ),
                                ],
                              ).box.padding(const EdgeInsets.all(8)).make(),

                              //[ IconButton( onPressed: () {},icon: Icon(Icons.remove)),"0"
                              //    .text.size(16).color(darkFontGrey)
                              //  .fontFamily(bold)
                              //.make(),
                              // IconButton(
                              //   onPressed: () {},
                              // icon: Icon(Icons.add)),
                              //10.widthBox,
                              //"(0 available)"
                              //  .text
                              //.color(textfieldGrey)
                              //.make(),
                              //],

                              //quantity row
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: "Quantity "
                                        .text
                                        .color(textfieldGrey)
                                        .make(),
                                  ),
                                  Obx(
                                    () => Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller.decreaseQuantity();
                                              controller.calculateTotalPrice(
                                                  int.parse(data['p_price']));
                                            },
                                            icon: const Icon(Icons.remove)),
                                        controller.quantity.value.text
                                            .size(16)
                                            .color(darkFontGrey)
                                            .fontFamily(bold)
                                            .make(),
                                        IconButton(
                                            onPressed: () {
                                              controller.increaseQuantity(
                                                  int.parse(
                                                      data['p_quantity']));
                                              controller.calculateTotalPrice(
                                                  int.parse(data['p_price']));
                                            },
                                            icon: const Icon(Icons.add)),
                                        10.widthBox,
                                        "(${data['p_quantity']} available)"
                                            .text
                                            .color(textfieldGrey)
                                            .make(),
                                      ],
                                    ),
                                  ),
                                ],
                              ).box.padding(const EdgeInsets.all(8)).make(),

                              //total row
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: "total: "
                                        .text
                                        .color(textfieldGrey)
                                        .make(),
                                  ),
                                  "${controller.totalPrice.value}"
                                      .numCurrency
                                      .text
                                      .color(Colors.red)
                                      .size(16)
                                      .fontFamily(bold)
                                      .make(),
                                ],
                              ).box.padding(const EdgeInsets.all(8)).make(),
                            ],
                          ).box.white.shadowSm.make(),
                        ),

                        //description
                        10.heightBox,
                        "Description"
                            .text
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make(),
                        10.heightBox,
                        "${data['p_desc']}".text.color(darkFontGrey).make(),

                        //buttons selection
                        10.heightBox,

                        ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: List.generate(
                            ItemDetailButtonList.length,
                            (index) => ListTile(
                              title: "${ItemDetailButtonList[index]}"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              trailing: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ),
                        20.heightBox,
                        //products may you like sectiobn
                        productyoumaylike.text
                            .fontFamily(bold)
                            .size(16)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP1,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        10.heightBox,
                                        "Mahindra800"
                                            .text
                                            .fontFamily(bold)
                                            .color(darkFontGrey)
                                            .make(),
                                        10.heightBox,
                                        "262,000 BDT/-"
                                            .text
                                            .size(16)
                                            .fontFamily(semibold)
                                            .color(const Color.fromARGB(
                                                255, 7, 33, 150))
                                            .make()
                                      ],
                                    )
                                        .box
                                        .white
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .rounded
                                        .padding(const EdgeInsets.all(8))
                                        .make()),
                          ),
                        )
                      ],
                    ),
                  )
                  // color: Color.fromARGB(255, 143, 235, 122),
                  )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: greenColor,
                onPress: () {
                  controller.addToCart(
                      data['p_name'],
                      data['p_imgs'][0],
                      controller.quantity.value,
                      data['p_colors'][controller.colorIndex.value],
                      data['p_seller'],
                      //controller.totalPrice.value,
                      data['p_price'],
                      context);
                  VxToast.show(context, msg: "Added to cart");
                },
                textColor: whiteColor,
                title: "Add to cart"),
          ),
        ],
      ),
    );
  }
}
