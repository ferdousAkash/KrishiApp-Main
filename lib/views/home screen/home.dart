import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/views/auth_screen/login_screen.dart';
import 'package:flutter_application_1/views/cart_screen/cart_screen.dart';
import 'package:flutter_application_1/views/category_screen/category_screen.dart';
import 'package:flutter_application_1/views/home%20screen/home_screen.dart';
import 'package:flutter_application_1/views/plant_Ai/plant_ai.dart';
import 'package:flutter_application_1/views/profile_screen/profile_screen.dart';
import 'package:flutter_application_1/views/weather_screen/weather_screen.dart';
import 'package:flutter_application_1/wigtes/exit_dialog.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(Homecontroller());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: catagory),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account),
      BottomNavigationBarItem(
          icon: Image.asset(icWeather, width: 26), label: weather),
      BottomNavigationBarItem(
          icon: Image.asset(icPlant, width: 26), label: plant),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen(),
      WeatherScreen(),
      PlantScreen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        showAdaptiveDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const LoginScreen());
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
                child: navBody.elementAt(controller.CurrentNavIndex.value))),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.CurrentNavIndex.value,
            selectedItemColor: red,
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            backgroundColor: whiteColor,
            type: BottomNavigationBarType.fixed,
            items: navbarItem,
            onTap: (value) {
              controller.CurrentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
