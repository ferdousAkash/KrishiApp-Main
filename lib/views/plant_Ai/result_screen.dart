import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/consts.dart';

class SingleOrder extends StatefulWidget {
  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0.0,
            top: 10.0,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                imgPi1,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kToolbarHeight,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Details About\n",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        TextSpan(
                          text: "Sample",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white),
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 16.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Plant Sample:",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Color.fromRGBO(74, 77, 84, 1),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        const Text(
                          "Potato",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(214, 13, 13, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        getItemRow(
                            "1", "Late Blight ", "(Phytophthora infestans)"),
                        getItemRow("2", "Accuracy", "87%"),
                        getItemRow("3", "Leaf sample visivility", "71%"),
                        getItemRow("4", "MobileNet", "3*1*1 Convolution"),
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Text(
                          "Discription\n\nLate blight, caused by the pathogen Phytophthora infestans, is a devastating disease that affects potato plants. This disease is infamous for its role in the Irish Potato Famine in the 1840s and continues to be a significant threat to potato crops today",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(216, 4, 4, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),

                        // getItemRow("3", "T-shirt (woman)", "\$30.00"),
                        // Divider(),
                        // getSubtotalRow("Subtotal", "\$200.00"),
                        // getSubtotalRow("Delivery", "\$225.00"),
                        // const SizedBox(
                        //   height: 10.0,
                        // ),
                        // getTotalRow("Total", "\$225.00"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    height: 127,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Course of Action",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Color.fromRGBO(74, 77, 84, 1),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Use fungicides, including copper-based \noptions, to protect potato plants from late \nblight. Regular applications, especially during \nperiods of high disease risk",
                                    style: TextStyle(
                                      color: Color.fromRGBO(4, 70, 145, 1),
                                    ),
                                  ),
                                  // TextSpan(
                                  //   text: "24 January 2021",
                                  //   style: TextStyle(
                                  //     color: Color.fromRGBO(74, 77, 84, 1),
                                  //     fontSize: 15.0,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getTotalRow(String title, String amount) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(19, 22, 33, 1),
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          amount,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
            fontSize: 17.0,
          ),
        )
      ],
    ),
  );
}

Widget getSubtotalRow(String title, String price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
          ),
        )
      ],
    ),
  );
}

Widget getItemRow(String count, String item, String price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          count,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            " x $item",
            style: TextStyle(
              color: Color.fromRGBO(143, 148, 162, 1),
              fontSize: 15.0,
            ),
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
          ),
        )
      ],
    ),
  );
}
