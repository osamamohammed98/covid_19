import 'package:covid_19/network/api/api_manager.dart';
import 'package:covid_19/network/data/country.dart';
import 'package:covid_19/network/data/world_data.dart';
import 'package:covid_19/widjets/container_big_data.dart';
import 'package:covid_19/widjets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Country>> countryData;
  Future<List<WorldWip>> worldData;

  @override
  void initState() {
    super.initState();
    countryData = getCountry();
    worldData = getWorld();
  }

  String mySelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home",
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xFFE5E5E5)),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/maps-and-flags.svg",
                  ),
                  Expanded(
                    child: FutureBuilder<List<Country>>(
                      future: countryData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Country> list = snapshot.data;
                          return DropdownButton(
                            isExpanded: true,
                            hint: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text("Select Country"),
                            ),
                            value: mySelect,
                            underline: SizedBox(
                              width: 20,
                            ),
                            icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                            items: list.map((Country menuItem) {
                              return DropdownMenuItem(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(menuItem.country),
                                ),
                                value: menuItem.country,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(
                                () {
                                  mySelect = value;
                                },
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text("");
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Case Update\n", style: kTitleTextstyle),
                            TextSpan(
                              text: "News Update at 3 month",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See Details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          color: kShadowColor,
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: FutureBuilder<List<WorldWip>>(
                      future: worldData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          WorldWip world = snapshot.data[0];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ContainerBigData(
                                title: "Infected",
                                color: kInfectedColor,
                                number: world.totalConfirmed == null
                                    ? 00000
                                    : world.totalConfirmed,
                              ),
                              ContainerBigData(
                                title: "Deaths",
                                color: kDeathColor,
                                number: world.totalDeaths == null
                                    ? 00000
                                    : world.totalDeaths,
                              ),
                              ContainerBigData(
                                title: "Recovered",
                                color: kRecovercolor,
                                number: world.totalRecovered == null
                                    ? 00000
                                    : world.totalRecovered,
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ContainerBigData(
                                title: "Infected",
                                color: kInfectedColor,
                                number: 00000,
                              ),
                              ContainerBigData(
                                title: "Deaths",
                                color: kDeathColor,
                                number: 00000,
                              ),
                              ContainerBigData(
                                title: "Recovered",
                                color: kRecovercolor,
                                number: 00000,
                              ),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                      Text(
                        "See Details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          color: kShadowColor,
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: Image.asset("assets/images/map.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
