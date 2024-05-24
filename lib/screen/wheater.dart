// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/mode/wheather_model.dart';
import 'package:flutter_app_teacher_titya/widget/wheather_widget.dart';
import 'package:flutter_app_teacher_titya/widget/wht_widget.dart';

import 'package:http/http.dart';

fetchData() async {
  Response result = await get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?lat=13.086616&lon=103.220411&appid=59a0507726eedfa7d709a3ccfcf7c10f&units=metric"));
  if (result.statusCode == 200) {
    wheatherModel m = wheatherModel.fromJson(jsonDecode(result.body));
    return m;
  } else {
    print(result.statusCode);
    return null;
  }
}

class Wheather extends StatefulWidget {
  const Wheather({super.key});

  @override
  State<Wheather> createState() => _WheatherState();
}

class _WheatherState extends State<Wheather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            wheatherModel m = snapshot.data;
            return DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: const NetworkImage(
                        "data:image/jpeg;base64,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"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "${m.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [],
                  ),
                  const Icon(Icons.nights_stay_outlined,
                      size: 100, color: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "27\u00B0",
                      style: TextStyle(fontSize: 70, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          Text(
                            "High",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("27\u00B0",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 70,
                        child: const VerticalDivider(
                          color: Colors.white,
                          thickness: 4,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Column(
                        children: [
                          Text("Low",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 15,
                          ),
                          Text("27\u00B0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables

                      children: [
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10)),
                        WheatherWidget(
                          text: 'NOW',
                          icon: Icons.thunderstorm_outlined,
                          text2: '27',
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        WheatherWidget(
                          text: '2AM - 3AM',
                          icon: Icons.cloudy_snowing,
                          text2: '27',
                          color: const Color.fromARGB(255, 128, 195, 251),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        WheatherWidget(
                          text: '4AM-5AM"',
                          icon: Icons.sunny,
                          text2: '27',
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        WheatherWidget(
                          text: '6AM-7AM',
                          icon: Icons.sunny_snowing,
                          text2: '27',
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5)),
                        WhtWidget(
                            icon: Icons.sunny,
                            text: "Monday",
                            text2: "27",
                            text3: "28",
                            color: Colors.white),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          height: 90,
                          child: const VerticalDivider(
                            color: Colors.white,
                            thickness: 4,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        WhtWidget(
                            icon: Icons.sunny,
                            text: "Tuesday",
                            text2: "27",
                            text3: "28",
                            color: Colors.yellow),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          height: 90,
                          child: const VerticalDivider(
                            color: Colors.white,
                            thickness: 4,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        WhtWidget(
                            icon: Icons.sunny,
                            text: "Wednesday",
                            text2: "27",
                            text3: "28",
                            color: Colors.yellow),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 90,
                          child: const VerticalDivider(
                            color: Colors.white,
                            thickness: 4,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        WhtWidget(
                            icon: Icons.sunny,
                            text: "Thursday",
                            text2: "27",
                            text3: "28",
                            color: Colors.yellow),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          height: 90,
                          child: const VerticalDivider(
                            color: Colors.white,
                            thickness: 4,
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        WhtWidget(
                            icon: Icons.sunny,
                            text: "Friday",
                            text2: "27",
                            text3: "28",
                            color: Colors.yellow),
                        const SizedBox(
                          width: 35,
                        ),
                        Container(
                          height: 90,
                          child: const VerticalDivider(
                            color: Colors.white,
                            thickness: 4,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        WhtWidget(
                            icon: Icons.sunny,
                            text: "Saturday",
                            text2: "27",
                            text3: "28",
                            color: Colors.yellow),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          height: 90,
                          child: const VerticalDivider(
                            color: Colors.white,
                            thickness: 4,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        WhtWidget(
                            icon: Icons.sunny,
                            text: "Sunday",
                            text2: "27",
                            text3: "28",
                            color: Colors.yellow),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
