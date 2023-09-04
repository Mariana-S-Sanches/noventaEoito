import 'package:flutter/material.dart';
import '../cubit/model/drivers_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noventa_oito/utils/text_field.dart';
import 'package:noventa_oito/utils/modal_popup.dart';
import 'package:noventa_oito/utils/text_styles.dart';
import 'package:noventa_oito/utils/primary_button.dart';
import 'package:noventa_oito/utils/default_colors.dart';
import 'package:noventa_oito/modules/cubit/drivers/drivers_cubit.dart';
import 'package:noventa_oito/modules/cubit/drivers/drivers_state.dart';

class FeedbackScreen extends StatefulWidget {
  final DriversModel driver;
  const FeedbackScreen({Key? key, required this.driver}) : super(key: key);

  @override
  FeedbackScreenState createState() => FeedbackScreenState();
}

class FeedbackScreenState extends State<FeedbackScreen> {
  int starsFromUser = 0;
  bool avaliationDone = false;
  TextEditingController controllerAvaliation = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                PrimaryButton(
                  onTap: () {
                    SimpleDialogModalWidget(
                      context,
                      body: StatefulBuilder(builder: (context, setState) {
                        return Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: CustomTextFields(
                                controller: controllerAvaliation,
                                labelText: 'Avalie sua corrida...',
                                maxLength: 300,
                                maxLines: null,
                              ),
                            ),
                            avaliation(setState),
                            Row(
                              children: [
                                Expanded(
                                  child: PrimaryButton(
                                    onTap: () {
                                      context.read<DriversCubit>().sendAvaliation(
                                            widget.driver,
                                            controllerAvaliation.text,
                                          );
                                      setState(() {
                                        avaliationDone = !avaliationDone;
                                      });

                                      Navigator.pop(context);
                                    },
                                    textButton: 'Enviar',
                                    sizeButton: SizeWidget.small,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                    );
                  },
                  sizeButton: SizeWidget.small,
                  isDisabled: avaliationDone,
                  textButton: avaliationDone ? 'Avaliação enviada' : 'Avaliar corrida',
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
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
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
  }

  final fullStar = const Icon(Icons.star, color: Colors.amber);
  final emptyStar = const Icon(Icons.star_border, color: Colors.amber);

  bool icon1 = false;
  bool icon2 = false;
  bool icon3 = false;
  bool icon4 = false;
  bool icon5 = false;
  Widget avaliation(void Function(void Function()) setState) {
    return Row(
      children: [
        IconButton(
          onPressed: () => starsPainter(1, setState),
          icon: icon1 ? fullStar : emptyStar,
        ),
        IconButton(
          onPressed: () => starsPainter(2, setState),
          icon: icon2 ? fullStar : emptyStar,
        ),
        IconButton(
          onPressed: () => starsPainter(3, setState),
          icon: icon3 ? fullStar : emptyStar,
        ),
        IconButton(
          onPressed: () => starsPainter(4, setState),
          icon: icon4 ? fullStar : emptyStar,
        ),
        IconButton(
          onPressed: () => starsPainter(5, setState),
          icon: icon5 ? fullStar : emptyStar,
        ),
      ],
    );
  }

  starsPainter(int index, void Function(void Function()) setState) {
    switch (index) {
      case 1:
        setState(() {
          icon1 = true;
          icon2 = false;
          icon3 = false;
          icon4 = false;
          icon5 = false;
        });
        break;
      case 2:
        setState(() {
          icon1 = true;
          icon2 = true;
          icon3 = false;
          icon4 = false;
          icon5 = false;
        });
        break;
      case 3:
        setState(() {
          icon1 = true;
          icon2 = true;
          icon3 = true;
          icon4 = false;
          icon5 = false;
        });
        break;
      case 4:
        setState(() {
          icon1 = true;
          icon2 = true;
          icon3 = true;
          icon4 = true;
          icon5 = false;
        });
        break;
      case 5:
        setState(() {
          icon1 = true;
          icon2 = true;
          icon3 = true;
          icon4 = true;
          icon5 = true;
        });
        break;
      default:
        setState(() {
          icon1 = false;
          icon2 = false;
          icon3 = false;
          icon4 = false;
          icon5 = false;
        });
        break;
    }
  }
}
