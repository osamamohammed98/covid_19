import 'package:covid_19/constant.dart';
import 'package:covid_19/views/home_screen.dart';
import 'file:///E:/AndroidStudioProjects/Flutter/covid_19/lib/views/info_screen.dart';
import 'package:covid_19/widjets/container_big_data.dart';
import 'package:covid_19/widjets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'network/api/api_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: TextTheme(
            body1: TextStyle(
              color: kBodyTextColor,
            ),
          ),
          fontFamily: "Poppins"),
      home: HomeScreen(),
    );
  }
}




