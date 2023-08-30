import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noventa_oito/modules/cubit/drivers_state.dart';
import '../cubit/drivers_cubit.dart';
import '../cubit/model/drivers_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<DriversModel> drivers = [];

  @override
  void initState() {
    context.read<DriversCubit>().getDriversExternal(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriversCubit, DriversState>(
      listener: (context, state){},
      builder: (context, state) {
        return Container(
          color: Colors.pink[200],
        );
      }
    );
  }
}
