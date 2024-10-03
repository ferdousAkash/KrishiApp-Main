import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/views/auth_screen/login_screen.dart';
import 'package:flutter_application_1/views/cart_screen/cart_screen.dart';
import 'package:flutter_application_1/views/cart_screen/shiping_screen.dart';
import 'package:flutter_application_1/views/home%20screen/home.dart';
import 'package:flutter_application_1/views/plant_Ai/result_screen.dart';
import 'package:flutter_application_1/views/profile_screen/profile_screen.dart';
import 'package:flutter_application_1/wigtes/applogo_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_application_1/consts/styles.dart';
import 'package:flutter_application_1/consts/strings.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/loading.json'),

      // Column(
      //   children: [
      //     Image.asset(imgS1),
      //     const Text(
      //       "Please Wait while detecting sample",
      //       style: TextStyle(
      //           fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      //     )
      //   ],
      // ),
      backgroundColor: whiteColor,
      nextScreen: SingleOrder(),
      splashIconSize: 250,
      duration: 100000,
      // splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
