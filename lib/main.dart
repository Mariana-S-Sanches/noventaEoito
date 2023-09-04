import 'package:flutter/material.dart';
import 'modules/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noventa_oito/utils/default_colors.dart';
import 'modules/cubit/drivers/external/drivers_external.dart';
import 'package:noventa_oito/modules/cubit/runs/runs_cubit.dart';
import 'package:noventa_oito/modules/historic/historic_runs.dart';
import 'package:noventa_oito/modules/cubit/runs/external/my_runs.dart';
import 'package:noventa_oito/modules/cubit/drivers/drivers_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DriversCubit>(
          create: (context) => DriversCubit(
            doGetDrivers: DriversExternal(),
            overwriteDrivers: OverwriteDrivers(),
          ),
        ),
        BlocProvider<RunsCubit>(
          create: (context) => RunsCubit(doGetRuns: MyRunsExternal()),
        ),
      ],
      child: MaterialApp(
        title: '98',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: DefaultColors.primaryTheme),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    PageViewControllerMain.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const ClampingScrollPhysics(),
        controller: PageViewControllerMain.pageController,
        onPageChanged: onPageChanged,
        children: const [
          MainScreen(),
          HistoricRuns(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'Histórico',
          ),
        ],
        currentIndex: PageViewControllerMain.pageIndex,
        onTap: (i) {
          PageViewControllerMain.pageController.animateToPage(
            i,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        activeColor: DefaultColors.primaryTheme,
        inactiveColor: Colors.grey,
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      PageViewControllerMain.pageIndex = index;
    });
  }
}

class PageViewControllerMain {
  static PageController pageController = PageController();
  static int pageIndex = 0;
  void onPageChanged(int index) {
    pageIndex = index;
  }
}
