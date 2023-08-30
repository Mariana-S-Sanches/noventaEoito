import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/cubit/drivers_cubit.dart';
import 'modules/cubit/external/drivers_external.dart';
import 'modules/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '98',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: BlocProvider<DriversCubit>(
        create: (context) => DriversCubit(doGetDrivers: DriversExternal()),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const ClampingScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          const MainScreen(),
          Container(color: Colors.purple),
          Container(color: Colors.pink),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumbs_up_down_rounded),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'Histórico',
          ),
        ],
        currentIndex: pageIndex,
        onTap: (i) {
          pageController.jumpToPage(i);
        },
        activeColor: Colors.teal,
        inactiveColor: Colors.grey,
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
