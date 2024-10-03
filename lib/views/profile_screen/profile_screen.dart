// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/consts/consts.dart';
// import 'package:flutter_application_1/consts/lists.dart';
// import 'package:flutter_application_1/controller/auth_controller.dart';
// import 'package:flutter_application_1/controller/profile_controller.dart';
// import 'package:flutter_application_1/services/firestore_services.dart';
// import 'package:flutter_application_1/views/auth_screen/login_screen.dart';
// import 'package:flutter_application_1/views/profile_screen/components/details_card.dart';
// import 'package:flutter_application_1/views/profile_screen/edit_profile_screen.dart';
// import 'package:flutter_application_1/wigtes/bg_widget.dart';
// import 'package:flutter_application_1/consts/strings.dart';
// // ignore: unused_import
// import 'package:flutter_application_1/wigtes/our_button.dart';
// import 'package:get/get.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(ProfileController());

//     return bgWidget(
//       Scaffold(
//           body: StreamBuilder(
//               stream: FirestoreServices.getUser(currentUser!.uid),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(
//                       child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation(greenColor2)));
//                 } else {
//                   var data = snapshot.data!.docs[0];

//                   return SafeArea(
//                       child: Column(
//                     children: [
//                       //edit profile button
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: const Align(
//                                 alignment: Alignment.topRight,
//                                 child:
//                                     const Icon(Icons.edit, color: whiteColor))
//                             .onTap(() {
//                           controller.nameController.text = data['name'];

//                           Get.to(() => EditProfileScreen(data: data));
//                         }),
//                       ),

//                       //usrs details section

//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Row(
//                           children: [
//                             data['imageUrl'] == ''
//                                 ? Image.asset(imgProfile2,
//                                         width: 100, fit: BoxFit.cover)
//                                     .box
//                                     .roundedFull
//                                     .clip(Clip.antiAlias)
//                                     .make()
//                                 : Image.network(data['imageUrl'],
//                                         width: 100, fit: BoxFit.cover)
//                                     .box
//                                     .roundedFull
//                                     .clip(Clip.antiAlias)
//                                     .make(),
//                             10.widthBox,
//                             Expanded(
//                                 child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 "${data['name']}"
//                                     .text
//                                     .fontFamily(semibold)
//                                     .black
//                                     .make(),
//                                 "${data['email']}".text.black.make(),
//                               ],
//                             )),
//                             OutlinedButton(
//                               style: OutlinedButton.styleFrom(
//                                   side: const BorderSide(
//                                 color: whiteColor,
//                               )),
//                               onPressed: () {
//                                 Get.to(() => const LoginScreen());
//                               },
//                               child:
//                                   logout.text.fontFamily(semibold).black.make(),
//                             )
//                           ],
//                         ),
//                       ),

//                       20.heightBox,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           detailsCard(
//                               count: data['cart_count'],
//                               title: "In your cart",
//                               width: context.screenWidth / 3.4),
//                           detailsCard(
//                               count: data['wishlist_count'],
//                               title: "In your wishlist",
//                               width: context.screenWidth / 3.4),
//                           detailsCard(
//                               count: data['order_count'],
//                               title: " your orders",
//                               width: context.screenWidth / 3.4),
//                         ],
//                       ),

// ignore_for_file: prefer_const_constructors

//                       5.heightBox,
//                       //buttons section
//                       ListView.separated(
//                         shrinkWrap: true,
//                         separatorBuilder: (context, index) {
//                           return const Divider(color: lightGrey);
//                         },
//                         itemCount: profileButtonsList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ListTile(
//                             leading: Image.asset(
//                               profileButtonsIcons[index],
//                               width: 22,
//                             ),
//                             title: profileButtonsList[index]
//                                 .text
//                                 .fontFamily(semibold)
//                                 .color(darkFontGrey)
//                                 .make(),
//                           );
//                         },
//                       )
//                           .box
//                           .white
//                           .rounded
//                           .margin(EdgeInsets.all(12))
//                           .padding(EdgeInsets.symmetric(horizontal: 16))
//                           .shadowSm
//                           .make()
//                           .box
//                           .color(greenColor)
//                           .make(),
//                     ],
//                   ));
//                 }
//               })),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/consts/lists.dart';
import 'package:flutter_application_1/controller/profile_controller.dart';
import 'package:flutter_application_1/services/firestore_services.dart';
import 'package:flutter_application_1/views/auth_screen/login_screen.dart';
import 'package:flutter_application_1/views/profile_screen/components/details_card.dart';
import 'package:flutter_application_1/views/profile_screen/edit_profile_screen.dart';
import 'package:flutter_application_1/wigtes/bg_widget.dart';
import 'package:flutter_application_1/consts/strings.dart';
import 'package:flutter_application_1/wigtes/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      Scaffold(
          body: StreamBuilder(
              stream: FirestoreServices.getUser(currentUser!.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  // ignore: prefer_const_constructors
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(greenColor2),
                    ),
                  );
                } else {
                  var data = snapshot.data!.docs[0];
                  return SafeArea(
                      child: Column(
                    children: [
                      //edit profile button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.edit, color: whiteColor))
                            .onTap(() {
                          Get.to(() => EditProfileScreen(data: data));
                        }),
                      ),

                      //usrs details section

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Image.asset(imgProfile2,
                                    width: 100, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make(),
                            10.widthBox,
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .black
                                    .make(),
                                "${data['email']}".text.black.make(),
                              ],
                            )),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                color: whiteColor,
                              )),
                              onPressed: () {
                                Get.offAll(() => const LoginScreen());
                              },
                              child:
                                  logout.text.fontFamily(semibold).black.make(),
                            )
                          ],
                        ),
                      ),

                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(
                              count: data['cart_count'],
                              title: "In your cart",
                              width: context.screenWidth / 3.4),
                          detailsCard(
                              count: data['wishlist_count'],
                              title: "In your wishlist",
                              width: context.screenWidth / 3.4),
                          detailsCard(
                              count: data['order_count'],
                              title: " your orders",
                              width: context.screenWidth / 3.4),
                        ],
                      ),

                      5.heightBox,
                      //buttons section
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Divider(color: lightGrey);
                        },
                        itemCount: profileButtonsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset(
                              profileButtonsIcons[index],
                              width: 22,
                            ),
                            title: profileButtonsList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          );
                        },
                      )
                          .box
                          .white
                          .rounded
                          .margin(EdgeInsets.all(12))
                          .padding(EdgeInsets.symmetric(horizontal: 16))
                          .shadowSm
                          .make()
                          .box
                          .color(greenColor)
                          .make(),
                    ],
                  ));
                }
              })),
    );
  }
}
