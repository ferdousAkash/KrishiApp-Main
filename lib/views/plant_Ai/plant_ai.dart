import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/views/cart_screen/payment_screen.dart';
import 'package:flutter_application_1/views/splash_screens/splash_screen_2.dart';
import 'package:flutter_application_1/wigtes/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_application_1/consts/images.dart';
import 'package:image_picker/image_picker.dart';

class PlantScreen extends StatefulWidget {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  File? _image;
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }

      final imageTemp = File(image.path);

      setState(
        () {
          this._image = imageTemp;
        },
      );
    } on PlatformException catch (e) {
      print("Failed to get image:  $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: "Plant Disesaes Alalysis"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: () {
            Get.to(() => const SplashScreen2());
          },
          color: greenColor,
          title: "Analyze",
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          _image != null
              ? Image.file(
                  _image!,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  imgS10,
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill,
                ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
              title: "Upload an Image",
              icon: Icons.image_outlined,
              onClick: () => getImage(ImageSource.gallery),
              coolor: red),
          CustomButton(
              title: "Open Camera",
              icon: Icons.camera,
              onClick: () => getImage(ImageSource.camera),
              coolor: Color.fromARGB(255, 4, 172, 164)),
        ],
      )),
    );
  }

  Widget CustomButton(
      {required String title,
      required IconData icon,
      required VoidCallback onClick,
      required coolor}) {
    return SizedBox(
      width: 280,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: coolor),
        onPressed: onClick,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 20,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
