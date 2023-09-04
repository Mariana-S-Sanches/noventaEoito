import 'package:flutter/material.dart';
import '../../utils/default_colors.dart';
import '../cubit/model/drivers_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noventa_oito/utils/text_styles.dart';
import 'package:noventa_oito/utils/shimmer_load.dart';
import 'package:noventa_oito/utils/drivers_list_tile.dart';
import 'package:noventa_oito/modules/cubit/drivers/drivers_cubit.dart';
import 'package:noventa_oito/modules/cubit/drivers/drivers_state.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultColors.primaryTheme[300],
        title: Text(
          'Motoristas disponíveis',
          style: CustomTextStyles.body.copyWith(color: Colors.white),
        ),
      ),
      body: BlocConsumer<DriversCubit, DriversState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DriverRunState) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: context.read<DriversCubit>().avaliableDrivers.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: DriversListTile(
                      driver: context.read<DriversCubit>().avaliableDrivers[i],
                    ),
                  );
                },
              ),
            );
          }
          if (state is DriversSucessState || state is DriversSucessState) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: context.read<DriversCubit>().avaliableDrivers.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: DriversListTile(
                      driver: context.read<DriversCubit>().avaliableDrivers[i],
                    ),
                  );
                },
              ),
            );
          } else {
            return const ShimmerLoadingAnimation();
          }
        },
      ),
    );
  }
}
