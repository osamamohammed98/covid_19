import 'dart:convert';

import 'package:covid_19/network/data/country.dart';
import 'package:covid_19/network/data/world_data.dart';
import 'package:http/http.dart';

String urlCountries = "https://api.covid19api.com/countries";
String urlWorldWIP =
    "https://api.covid19api.com/world?from=2020-11-01T00:00:00Z&to=2021-12-01T00:00:00Z";

Future<List<Country>> getCountry() async {
  Response response = await get(urlCountries, headers: {
    "Accept": "Application/json; charset=UTF-8",
    "Content-Type": "Application/Json; charset=UTF-8",
  });

  if (response.statusCode == 200) {
    print(response.body);
    final parsedData = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsedData
        .map<Country>((modle) => Country.fromJson(modle))
        .toList(); //Country.fromJson(json.decode(response.body));
  } else {
    return throw Exception("${response.statusCode}  ${response.body}");
  }
}

Future<List<WorldWip>> getWorld() async {
  Response response = await get(urlWorldWIP, headers: {
    "Accept": "Application/json; charset=UTF-8",
    "Content-Type": "Application/Json; charset=UTF-8",
  });

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed
        .map<WorldWip>((jsonModel) => WorldWip.fromJson(jsonModel))
        .toList();
  } else {
    return throw Exception("${response.statusCode}  ${response.body}");
  }
}
