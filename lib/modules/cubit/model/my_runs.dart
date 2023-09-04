import 'dart:convert';

import 'package:noventa_oito/modules/cubit/model/drivers_model.dart';

MyRuns myRunsFromJson(String str) => MyRuns.fromJson(json.decode(str));

String myRunsToJson(MyRuns data) => json.encode(data.toJson());

class MyRuns {
  List<DriversModel> runs;
  List<DriversModel> canceled;

  MyRuns({
    required this.runs,
    required this.canceled,
  });

  factory MyRuns.fromJson(Map<String, dynamic> json) => MyRuns(
        runs: List<DriversModel>.from(json["runs"].map((x) => DriversModel.fromJson(x))),
        canceled: List<DriversModel>.from(json["canceled"].map((x) => DriversModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "runs": List<dynamic>.from(runs.map((x) => x.toJson())),
        "canceled": List<dynamic>.from(canceled.map((x) => x.toJson())),
      };
}
