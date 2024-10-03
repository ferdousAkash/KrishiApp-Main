import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/views/home%20screen/home.dart';
import 'package:flutter_application_1/wigtes/applogo_widget.dart';
import 'package:flutter_application_1/wigtes/bg_widget.dart';
import 'package:flutter_application_1/wigtes/custom_textfields.dart';
import 'package:flutter_application_1/wigtes/our_button.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUp> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(icAppLogo2),
              10.heightBox,
              "Join the $appname"
                  .text
                  .fontFamily(bold)
                  .color(Color.fromARGB(255, 158, 90, 12))
                  .size(20)
                  .make(),
              10.heightBox,
              Obx(
                () => Column(
                  children: [
                    customtextfield(
                        hint: name,
                        title: name,
                        controller: nameController,
                        isPass: false),
                    customtextfield(
                        hint: emailHint,
                        title: mail,
                        controller: emailController,
                        isPass: false),
                    customtextfield(
                        hint: passhint,
                        title: password,
                        controller: passwordController,
                        isPass: true),
                    customtextfield(
                        hint: passhint,
                        title: retypepass,
                        controller: passwordRetypeController,
                        isPass: true),
                    // Align(
                    //     alignment: Alignment.centerRight,
                    //     child: TextButton(
                    //         onPressed: () {}, child: forgetpass.text.make())),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: red,
                          checkColor: blue,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          },
                        ),
                        10.widthBox,
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "I agree with the ",
                                  style: TextStyle(
                                      fontFamily: bold, color: fontGrey)),
                              TextSpan(
                                  text: "terms and conditions",
                                  style:
                                      TextStyle(fontFamily: bold, color: red)),
                            ],
                          ),
                        )
                      ],
                    ),
                    10.heightBox,
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(greenColor),
                          )
                        : ourButton(
                            color: isCheck == true ? greenColor : lightGrey,
                            title: signup,
                            textColor: whiteColor,
                            onPress: () async {
                              if (isCheck != false) {
                                controller.isloading(true);
                                try {
                                  await controller
                                      .signupMethod(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) {
                                    return controller.storeUserData(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text);
                                  }).then((value) {
                                    VxToast.show(context, msg: loggedin);
                                    Get.offAll(() => Home());
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isloading(false);
                                }
                              }
                            }).box.width(context.screenWidth - 40).make(),
                    10.heightBox,
                    //wraping into gesture detector velocity app
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: haveaccount,
                            style: TextStyle(fontFamily: bold, color: red),
                          ),
                          TextSpan(
                            text: login,
                            style: TextStyle(fontFamily: bold, color: blue),
                          ),
                        ],
                      ),
                    ).onTap(() {
                      Get.back();
                    })
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
          ),
        ),
      ),
    );
  }
}
