import 'dart:convert';

List<WorldWip> worldWipFromJson(String str) => List<WorldWip>.from(json.decode(str).map((x) => WorldWip.fromJson(x)));

String worldWipToJson(List<WorldWip> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorldWip {
  WorldWip({
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
  });

  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  factory WorldWip.fromJson(Map<String, dynamic> json) => WorldWip(
    newConfirmed: json["NewConfirmed"],
    totalConfirmed: json["TotalConfirmed"],
    newDeaths: json["NewDeaths"],
    totalDeaths: json["TotalDeaths"],
    newRecovered: json["NewRecovered"],
    totalRecovered: json["TotalRecovered"],
  );

  Map<String, dynamic> toJson() => {
    "NewConfirmed": newConfirmed,
    "TotalConfirmed": totalConfirmed,
    "NewDeaths": newDeaths,
    "TotalDeaths": totalDeaths,
    "NewRecovered": newRecovered,
    "TotalRecovered": totalRecovered,
  };
}
