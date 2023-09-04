import 'package:flutter/material.dart';

import '../../model/my_runs.dart';

class MyRunsExternal {
  Future<MyRuns> getRuns(BuildContext context) async {
    try {
      String data = await DefaultAssetBundle.of(context).loadString("fake_drivers/my_runs.json");
      MyRuns runs = myRunsFromJson(data);
      return runs;
    } catch (e) {
      debugPrint("Error: $e");
      throw Exception(e);
    }
  }
}
