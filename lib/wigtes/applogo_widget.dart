import 'package:flutter_application_1/consts/consts.dart';

Widget applogoWidget(image) {
  return Image.asset(image)
      .box
      .white
      .size(300, 200)
      .padding(const EdgeInsets.all(1))
      .rounded
      .make();
}
