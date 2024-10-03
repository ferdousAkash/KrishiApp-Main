// import 'package:flutter/material.dart';

// class WeatherScreen extends StatelessWidget {
//   const WeatherScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Color.fromARGB(255, 255, 0, 0));
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/consts/lists.dart';
// import 'package:flutter_application_1/geolocation.dart';
import 'package:flutter_application_1/views/home%20screen/componants/featured_button.dart';
import 'package:flutter_application_1/weatherData.dart';
import 'package:flutter_application_1/wigtes/home_buttons.dart';
import 'package:intl/intl.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyy').format(dayInfo);

class WeatherScreen extends StatelessWidget {
  // const WeatherScreen({Key? key}) : super(key: key);
  var client = WeatherData();
  var data;

  info() async {
    //var position = await GetPosition();
    data = await client.getData(23.72, 90.41);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
            future: info(),
            builder: ((context, snapshot) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.75,
                      width: size.width,
                      padding: EdgeInsets.only(top: 30),
                      margin: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff955cd1),
                            Color(0xff3fa2fa),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.2, 0.85],
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${data?.cityname}',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 35,
                                fontFamily: bold),
                          ),
                          Text(
                            dateFormat,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 20,
                                fontFamily: bold),
                          ),
                          Image.network(
                            'http:${data?.icon}',
                            width: size.width * 0.36,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.condition}',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 23,
                                fontFamily: bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.temp}',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 60,
                                fontWeight: FontWeight.w800,
                                fontFamily: bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(windDirect,
                                        width: size.width * 0.15),
                                    Text(
                                      '${data?.wind}km/h',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: bold,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Wind',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontFamily: bold,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(windih,
                                        width: size.width * 0.15),
                                    Text(
                                      'Wind Dir',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: bold,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${data?.wind_dir}',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontFamily: bold,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(humidity,
                                        width: size.width * 0.15),
                                    const Text(
                                      'Humidity',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: bold,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${data?.humidity}',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontFamily: bold,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Gust',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${data?.gust}km/h',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Pressure',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${data?.pressure} hpa',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Water',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '402/570',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 209, 24, 24),
                                  fontSize: 23,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Flood',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '72%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'kerala',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Last Update',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${data?.last_update}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 11, 217, 236),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            })));
  }
}
