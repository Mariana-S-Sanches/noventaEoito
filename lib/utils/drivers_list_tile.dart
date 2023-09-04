import 'package:flutter/material.dart';
import 'package:noventa_oito/utils/navigator.dart';
import '../modules/driver_screen/driver_screen.dart';
import 'package:noventa_oito/utils/text_styles.dart';
import 'package:noventa_oito/utils/default_colors.dart';
import 'package:noventa_oito/modules/cubit/model/drivers_model.dart';

// ignore: must_be_immutable
class DriversListTile extends StatelessWidget {
  final DriversModel driver;
  Widget? trailing;
  DriversListTile({Key? key, required this.driver, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
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
            offset: const Offset(25, 25),
            blurRadius: 30.0,
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            RouteNavigator(
              page: DriverScreen(
                driver: driver,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(driver.photoUrl),
        ),
        title: Text(
          driver.name,
          style: CustomTextStyles.bodySmall,
        ),
        subtitle: Row(
          children: [
            Text(
              'Corridas: ',
              style: CustomTextStyles.label,
            ),
            Text(
              driver.runs.toString(),
              style: CustomTextStyles.label,
            ),
          ],
        ),
        trailing: trailing ??
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${driver.stars}',
                  style: CustomTextStyles.body,
                ),
                Text(
                  '/5',
                  style: CustomTextStyles.bodySmall,
                ),
              ],
            ),
      ),
    );
  }
}
