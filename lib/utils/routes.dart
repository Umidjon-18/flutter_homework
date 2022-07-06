import 'package:flutter/material.dart';
import 'package:flutter_homework/weather/weather_page.dart';



class Routes {
  static const discoverPage = '/discoverPage';
  static const comparePage = '/';
  static const currencyPage = '/currencyPage';
  static const weatherPage = '/weatherPage';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    try {
      Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        // case comparePage:
        //   return MaterialPageRoute(builder: (context) => const ComparePage());
        case weatherPage:
          return MaterialPageRoute(builder: (context) => const WeatherPage());
        // case currencyPage:
        //   return MaterialPageRoute(
        //       builder: (context) => CurrencyPage(args?['list_currency'],
        //           args?['top_cur'], args?['bottom_cur']));
        default:
          return MaterialPageRoute(builder: (context) => const WeatherPage());
      }
    } catch (e) {
      return MaterialPageRoute(builder: (context) => const WeatherPage());
    }
  }
}
