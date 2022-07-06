
import 'package:flutter/material.dart';
import 'package:flutter_homework/weather/weather_model.dart';
import 'package:flutter_homework/weather/weather_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<WeatherModel>(WeatherModelAdapter());
  runApp(const LessonApp());
}

class LessonApp extends StatelessWidget {
  const LessonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   textTheme: GoogleFonts.robotoTextTheme(),
      //   primaryTextTheme: GoogleFonts.robotoTextTheme(),
      //   accentTextTheme: GoogleFonts.robotoTextTheme()
      // ),
      // onGenerateRoute: (settings) => Routes.generateRoute(settings),
      home: WeatherPage(),
    );
  }
}
