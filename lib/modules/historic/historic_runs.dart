import 'package:flutter/material.dart';
import 'package:noventa_oito/modules/cubit/drivers/drivers_cubit.dart';
import 'package:noventa_oito/modules/cubit/model/drivers_model.dart';
import 'package:noventa_oito/modules/cubit/model/my_runs.dart';
import 'package:noventa_oito/utils/modal_popup.dart';
import '../cubit/runs/runs_cubit.dart';
import '../cubit/runs/runs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noventa_oito/utils/navigator.dart';
import 'package:noventa_oito/utils/text_styles.dart';
import 'package:noventa_oito/utils/shimmer_load.dart';
import 'package:noventa_oito/utils/default_colors.dart';
import 'package:noventa_oito/utils/drivers_list_tile.dart';
import 'package:noventa_oito/modules/feedback/feedback_screen.dart';

class HistoricRuns extends StatefulWidget {
  const HistoricRuns({Key? key}) : super(key: key);

  @override
  HistoricRunsState createState() => HistoricRunsState();
}

class HistoricRunsState extends State<HistoricRuns> {
  @override
  void initState() {
    context.read<RunsCubit>().getRunsExternal(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultColors.primaryTheme[300],
        title: Text(
          'Histórico de Corridas',
          style: CustomTextStyles.body.copyWith(color: Colors.white),
        ),
      ),
      body: BlocConsumer<RunsCubit, RunsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RunCancelSucessState) {
           return ListView(
              children: [
                context.read<RunsCubit>().driverRun != null ? runActual(context.read<RunsCubit>().driverRun!) : const SizedBox(),
                runsFinished(context.read<RunsCubit>().myRuns),
                runsCanceled(context.read<RunsCubit>().myRuns),
              ],
            );
          }
          if (state is RunsSucessState) {
            return ListView(
              children: [
                context.read<RunsCubit>().driverRun != null ? runActual(context.read<RunsCubit>().driverRun!) : const SizedBox(),
                runsFinished(state.myRuns),
                runsCanceled(state.myRuns),
              ],
            );
          } else {
            return const ShimmerLoadingAnimation();
          }
        },
      ),
    );
  }

  runActual(DriversModel driverRun) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Corridas em andamento',
            style: CustomTextStyles.body,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: DriversListTile(
            driver: driverRun,
            trailing: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  RouteNavigator(
                    page: FeedbackScreen(
                      driver: driverRun,
                    ),
                  ),
                );
              },
              child: IconButton(
                icon: const Icon(
                  Icons.close_sharp,
                  color: DefaultColors.red,
                ),
                onPressed: () {
                  SimpleDialogModalTwoButtons(
                    context,
                    bodyText: 'Deseja cancelar a corrida?',
                    buttonText: 'Sim',
                    secondButtonText: 'Não',
                    onTap: () {
                      context.read<RunsCubit>().cancelRun(driverRun);
                      context.read<DriversCubit>().cancelRun(driverRun);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  runsFinished(MyRuns myRuns) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Corridas concluídas',
            style: CustomTextStyles.body,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: myRuns.runs.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: DriversListTile(
                driver: myRuns.runs[i],
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      RouteNavigator(
                        page: FeedbackScreen(
                          driver: myRuns.runs[i],
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.thumb_up_rounded,
                        color: DefaultColors.green,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.thumb_down_rounded,
                          color: DefaultColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  runsCanceled(MyRuns myRuns) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Corridas canceladas',
            style: CustomTextStyles.body,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: myRuns.canceled.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: DriversListTile(
                driver: myRuns.canceled[i],
              ),
            );
          },
        ),
      ],
    );
  }
}
