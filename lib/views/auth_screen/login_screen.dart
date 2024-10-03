import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/consts/lists.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/views/auth_screen/signup_screen.dart';
import 'package:flutter_application_1/wigtes/applogo_widget.dart';
import 'package:flutter_application_1/wigtes/bg_widget.dart';
import 'package:flutter_application_1/wigtes/custom_textfields.dart';
import 'package:flutter_application_1/wigtes/our_button.dart';
import 'package:get/get.dart';

import '../home screen/home.dart';

// String name=login.text as String;
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(Scaffold(
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(icAppLogo3),
          10.heightBox,
          "Log in to $appname"
              .text
              .fontFamily(bold)
              .color(const Color.fromARGB(255, 12, 71, 27))
              .size(28)
              .make(),
          10.heightBox,
          Obx(
            () => Column(
              children: [
                customtextfield(
                    hint: emailHint,
                    title: "Email",
                    isPass: false,
                    controller: controller.emailController),
                customtextfield(
                    hint: passhint,
                    title: password,
                    isPass: true,
                    controller: controller.passwordController),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetpass.text.make())),
                5.heightBox,
                controller.isloading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(greenColor),
                      )
                    : ourButton(
                        color: greenColor2,
                        title: login,
                        textColor: whiteColor,
                        onPress: () async {
                          controller.isloading(true);
                          await controller
                              .loginMethod(context: context)
                              .then((value) {
                            if (value != null) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(() => const Home());
                            } else {
                              controller.isloading(false);
                            }
                          });
                        }).box.width(context.screenWidth - 40).make(),
                5.heightBox,
                creatnew.text
                    .color(Color.fromARGB(255, 0, 0, 0))
                    .size(14)
                    .make(),
                ourButton(
                    color: golden,
                    title: signup,
                    textColor: whiteColor,
                    onPress: () {
                      Get.to(() => const SignUp());
                    }).box.width(context.screenWidth - 40).make(),
                10.heightBox,
                loginwith.text
                    .color(const Color.fromARGB(255, 151, 10, 0))
                    .make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              child: Image.asset(
                                socialIconList[index],
                                width: 31,
                              ),
                            ),
                          )),
                )
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 40)
                .shadowSm
                .make(),
          ),
        ],
      )),
    ));
  }
}
