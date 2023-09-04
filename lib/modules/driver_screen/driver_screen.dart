import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noventa_oito/utils/text_styles.dart';
import 'package:noventa_oito/utils/default_colors.dart';
import 'package:noventa_oito/utils/primary_button.dart';
import 'package:noventa_oito/modules/cubit/runs/runs_state.dart';
import 'package:noventa_oito/modules/cubit/runs/runs_cubit.dart';
import 'package:noventa_oito/modules/cubit/model/drivers_model.dart';
import 'package:noventa_oito/modules/cubit/drivers/drivers_cubit.dart';
import 'package:noventa_oito/modules/cubit/drivers/drivers_state.dart';

class DriverScreen extends StatefulWidget {
  final DriversModel driver;
  const DriverScreen({Key? key, required this.driver}) : super(key: key);

  @override
  DriverScreenState createState() => DriverScreenState();
}

class DriverScreenState extends State<DriverScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RunsCubit, RunsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<DriversCubit, DriversState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: kToolbarHeight),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.close,
                              size: 30,
                              color: DefaultColors.primaryTheme[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(widget.driver.photoUrl),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    context.read<RunsCubit>().runInProgress == true
                        ? const SizedBox()
                        : PrimaryButton(
                            onTap: () {
                              context.read<DriversCubit>().startingRun(widget.driver);
                              context.read<RunsCubit>().startingRun(widget.driver);
                              context.read<DriversCubit>().runInProgress = true;
                              context.read<RunsCubit>().runInProgress = true;
                              setState(() {
                                Navigator.pop(context);
                                PageViewControllerMain.pageController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.linear,
                                );
                              });
                            },
                            sizeButton: SizeWidget.small,
                            textButton: 'Solicitar corrida',
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: DefaultColors.neutral[50]!.withOpacity(0.05),
                              offset: const Offset(-28, -28),
                              blurRadius: 30.0,
                            ),
                            BoxShadow(
                              color: DefaultColors.neutral[50]!,
                              offset: const Offset(10, 10),
                              blurRadius: 30.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                widget.driver.name,
                                style: CustomTextStyles.menu,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Corridas: ',
                                  style: CustomTextStyles.bodySmall,
                                ),
                                Text(
                                  widget.driver.runs.toString(),
                                  style: CustomTextStyles.bodySmall,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Estrelas: ',
                                    style: CustomTextStyles.bodySmall,
                                  ),
                                  Text(
                                    '${widget.driver.stars}/5',
                                    style: CustomTextStyles.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: DefaultColors.neutral[50]!.withOpacity(0.05),
                              offset: const Offset(-28, -28),
                              blurRadius: 30.0,
                            ),
                            BoxShadow(
                              color: DefaultColors.neutral[50]!,
                              offset: const Offset(10, 10),
                              blurRadius: 30.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 30),
                              child: Text(
                                'Avaliações',
                                style: CustomTextStyles.menu,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.driver.avaliations.length,
                              itemBuilder: (_, i) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: ListTile(
                                    title: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.driver.avaliations[i].user,
                                          style: CustomTextStyles.bodySmall,
                                        ),
                                        Text(
                                          widget.driver.avaliations[i].avaliation,
                                          style: CustomTextStyles.label,
                                        ),
                                      ],
                                    ),
                                    leading: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(widget.driver.avaliations[i].photoUrl),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
