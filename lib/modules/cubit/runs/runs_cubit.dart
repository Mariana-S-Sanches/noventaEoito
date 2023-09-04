import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noventa_oito/modules/cubit/model/my_runs.dart';
import 'package:noventa_oito/modules/cubit/runs/runs_state.dart';
import 'package:noventa_oito/modules/cubit/model/drivers_model.dart';
import 'package:noventa_oito/modules/cubit/runs/external/my_runs.dart';

class RunsCubit extends Cubit<RunsState> {
  final MyRunsExternal doGetRuns;

  RunsCubit({
    required this.doGetRuns,
  }) : super(RunsInitialState());

  bool runInProgress = false;
  DriversModel? driverRun;

  MyRuns myRuns = MyRuns(runs: [], canceled: []);

  void getRunsExternal(BuildContext context) async {
    emit(RunsLoadingState(true));

    var result = await doGetRuns.getRuns(context);
    if (myRuns.canceled.isEmpty) {
      myRuns = result;
    } else {
      result = myRuns;
    }

    emit(RunsSucessState(result));
  }

  void startingRun(DriversModel driver) {
    driverRun = driver;

    emit(NewRunSucessState(driverRun!));
  }

  void cancelRun(DriversModel driver) {
    driverRun = null;
    runInProgress = false;
    myRuns.canceled.add(driver);
    emit(RunCancelSucessState(driver));
  }
}
