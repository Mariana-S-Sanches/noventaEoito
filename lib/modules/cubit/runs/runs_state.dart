import 'package:equatable/equatable.dart';
import 'package:noventa_oito/modules/cubit/model/my_runs.dart';
import 'package:noventa_oito/modules/cubit/model/drivers_model.dart';

abstract class RunsState extends Equatable {}

class RunsInitialState extends RunsState {
  @override
  List<Object> get props => [];
}

class RunsLoadingState extends RunsState {
  final bool prop;

  RunsLoadingState(this.prop);

  @override
  List<Object> get props => [prop];
}

class RunsLoadState extends RunsState {
  final bool prop;

  RunsLoadState(this.prop);

  @override
  List<Object> get props => [prop];
}

class RunsSucessState extends RunsState {
  final MyRuns myRuns;

  RunsSucessState(this.myRuns);

  @override
  List<Object> get props => [myRuns];
}

class NewRunSucessState extends RunsState {
  final DriversModel newRun;

  NewRunSucessState(this.newRun);

  @override
  List<Object> get props => [newRun];
}

class RunCancelSucessState extends RunsState {
  final DriversModel cancelRun;

  RunCancelSucessState(this.cancelRun);

  @override
  List<Object> get props => [cancelRun];
}

class RunsErrorState extends RunsState {
  final String failure;

  RunsErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}
