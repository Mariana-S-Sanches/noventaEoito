import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noventa_oito/modules/cubit/model/drivers_model.dart';
import 'package:noventa_oito/modules/cubit/drivers/drivers_state.dart';
import 'package:noventa_oito/modules/cubit/drivers/external/drivers_external.dart';

class DriversCubit extends Cubit<DriversState> {
  final DriversExternal doGetDrivers;
  final OverwriteDrivers overwriteDrivers;

  DriversCubit({required this.doGetDrivers, required this.overwriteDrivers}) : super(DriversInitialState());

  bool runInProgress = false;
  List<DriversModel> avaliableDrivers = [];
  DriversModel? driverRun;

  void getDriversExternal(BuildContext context) async {
    if (avaliableDrivers.isEmpty) {
      emit(DriversLoadingState(true));

      var result = await doGetDrivers.getDrivers(context);
      avaliableDrivers = result;

      emit(DriversSucessState(result));
    }
  }

  void sendAvaliation(DriversModel driver, String avaliation) {
    // ignore: avoid_function_literals_in_foreach_calls
    avaliableDrivers.forEach((element) {
      if (element.name == driver.name) {
        element.avaliations.add(
          Avaliation(
            user: 'Convidado :)',
            photoUrl: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
            avaliation: avaliation,
          ),
        );
      }
    });
    driver.avaliations.add(
      Avaliation(
        user: 'Convidado :)',
        photoUrl: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
        avaliation: avaliation,
      ),
    );
    overwriteDrivers.overwriteDrivers(driversModelToJson(avaliableDrivers));
    emit(DriversSucessState(avaliableDrivers));
  }

  void startingRun(DriversModel driver) {
    driverRun = driver;

    avaliableDrivers.removeWhere((element) => element == driver);
    emit(DriverRunState(driverRun!));
  }

  void cancelRun(DriversModel driver) {
    driverRun = null;
    runInProgress = false;

    avaliableDrivers.add(driver);
    emit(DriversSucessState(avaliableDrivers));
  }
}
