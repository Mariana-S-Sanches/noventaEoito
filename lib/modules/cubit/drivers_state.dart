import 'package:equatable/equatable.dart';
import 'package:noventa_oito/modules/cubit/model/drivers_model.dart';

abstract class DriversState extends Equatable {}

class DriversInitialState extends DriversState {
  @override
  List<Object> get props => [];
}

class DriversLoadingState extends DriversState {
  final bool prop;

  DriversLoadingState(this.prop);

  @override
  List<Object> get props => [prop];
}
class DriversLoadState extends DriversState {
  final bool prop;

  DriversLoadState(this.prop);

  @override
  List<Object> get props => [prop];
}

class DriversSucessState extends DriversState {
  final List<DriversModel>  wordsModel;

  DriversSucessState(this.wordsModel);

  @override
  List<Object> get props => [wordsModel];
}

class DriversErrorState extends DriversState {
  final String failure;

  DriversErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}
