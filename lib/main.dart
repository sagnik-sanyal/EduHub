import 'package:edu_hub_flutter/views/home/home_screen.dart';
import 'package:edu_hub_flutter/views/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final prefs = await SharedPreferences.getInstance();
  final showhome = prefs.getBool('isSeen') ?? false;
  runApp(
    MyApp(
      showHome: showhome,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'EduHub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Nunito', scaffoldBackgroundColor: Colors.white),
        home: child,
        routes: {
          HomeWidget.route: (context) => const HomeWidget(),
        },
      ),
      child: showHome ? const HomeWidget() : const OnboardingScreen(),
    );
  }
}
