import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_homework/weather/weather_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'utils/routes.dart';

void main() async {
  // Directory appDocDir = await getApplicationDocumentsDirectory();
  // String appDocPath = appDocDir.path;
  await Hive.initFlutter();
  Hive.registerAdapter<WeatherModel>(WeatherModelAdapter());
  runApp(const LessonApp());
}

class LessonApp extends StatelessWidget {
  const LessonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   textTheme: GoogleFonts.robotoTextTheme(),
      //   primaryTextTheme: GoogleFonts.robotoTextTheme(),
      //   accentTextTheme: GoogleFonts.robotoTextTheme()
      // ),
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
    );
  }
}
