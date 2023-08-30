import 'package:flutter/material.dart';
import 'package:noventa_oito/modules/cubit/model/drivers_model.dart';

class DriversExternal {
  Future<List<DriversModel>> getDrivers(BuildContext context) async {
    try {
      String data = await DefaultAssetBundle.of(context).loadString("fake_drivers/fake_drivers.json");
      List<DriversModel> drivers = driversModelFromJson(data);
      return drivers;
    } catch (e) {
      debugPrint("Error: $e");
      throw Exception(e);
    }
  }
}
