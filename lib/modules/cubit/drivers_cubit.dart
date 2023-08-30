import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noventa_oito/modules/cubit/drivers_state.dart';
import 'package:noventa_oito/modules/cubit/external/drivers_external.dart';

class DriversCubit extends Cubit<DriversState> {
  final DriversExternal doGetDrivers;

  DriversCubit({
    required this.doGetDrivers,
  }) : super(DriversInitialState());

  void getDriversExternal(BuildContext context) async {
    emit(DriversLoadingState(true));

    var result = await doGetDrivers.getDrivers(context);

    emit(DriversSucessState(result));
  }
}
