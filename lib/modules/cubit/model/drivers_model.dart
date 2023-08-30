import 'dart:convert';

List<DriversModel> driversModelFromJson(String str) => List<DriversModel>.from(
      json.decode(str).map((x) => DriversModel.fromJson(x)),
    );

String driversModelToJson(List<DriversModel> data) => json.encode(
      List<dynamic>.from(data.map((x) => x.toJson())),
    );

class DriversModel {
  int runs;
  int stars;
  String name;
  int totalAvaliations;
  List<Avaliation> avaliations;

  DriversModel({
    required this.runs,
    required this.name,
    required this.stars,
    required this.avaliations,
    required this.totalAvaliations,
  });

  factory DriversModel.fromJson(Map<String, dynamic> json) => DriversModel(
        name: json["name"],
        runs: json["runs"],
        stars: json["stars"],
        totalAvaliations: json["total_avaliations"],
        avaliations: List<Avaliation>.from(json["avaliations"].map((x) => Avaliation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "runs": runs,
        "stars": stars,
        "total_avaliations": totalAvaliations,
        "avaliations": List<dynamic>.from(avaliations.map((x) => x.toJson())),
      };
}

class Avaliation {
  String user;
  String avaliation;

  Avaliation({
    required this.user,
    required this.avaliation,
  });

  factory Avaliation.fromJson(Map<String, dynamic> json) => Avaliation(
        user: json["user"],
        avaliation: json["avaliation"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "avaliation": avaliation,
      };
}
