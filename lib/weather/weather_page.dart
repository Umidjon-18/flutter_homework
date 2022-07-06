import 'dart:math';
import 'package:http/http.dart';
import '../utils/hive_util.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/utils/constants.dart';
import 'package:flutter_homework/weather/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> with HiveUtil {
  WeatherModel data = WeatherModel();

  Future<WeatherModel?> loadData(String city) async {
    data = WeatherModel();
    // var isLoad = await loadLocalData();

    // if (isLoad) {
      try {
        var response = await get(Uri.parse('https://obhavo.uz/$city'));
        if (response.statusCode == 200) {
          var document = parse(response.body);
          var days = [];
          var current = [];
          var tempDays = [];
          var feelings = [];
          var weekDays = [];
          var rainPercs = [];
          var tempNights = [];

          var currentWeather =
              document.getElementsByClassName('grid-1 cont-block')[0];
          current.add(
              currentWeather.getElementsByClassName('current-day')[0].text);
          current.add(currentWeather.getElementsByTagName('strong')[0].text);
          current.add(currentWeather.getElementsByTagName('span')[2].text);
          current.add(currentWeather
              .getElementsByClassName("current-forecast-desc")[0]
              .text);
          current.add(currentWeather.getElementsByTagName('p')[0].text);
          current.add(currentWeather.getElementsByTagName('p')[1].text);
          current.add(currentWeather.getElementsByTagName('p')[2].text);
          current.add(currentWeather.getElementsByTagName('p')[3].text);
          current.add(currentWeather.getElementsByTagName('p')[4].text);
          current.add(currentWeather.getElementsByTagName('p')[5].text);

          var weatherList = document
              .getElementsByClassName('weather-table')[0]
              .getElementsByTagName('tr');

          for (var i = 1; i < weatherList.length; i++) {
            weekDays.add(weatherList[i].getElementsByTagName('strong')[1].text);
            days.add(weatherList[i].getElementsByTagName('div')[1].text);
            tempDays.add(
                weatherList[i].getElementsByClassName('forecast-day')[0].text);
            tempNights.add(weatherList[i]
                .getElementsByClassName('forecast-night')[0]
                .text);
            feelings.add(weatherList[i]
                .getElementsByClassName('weather-row-desc')[0]
                .text);
            rainPercs.add(weatherList[i]
                .getElementsByClassName('weather-row-pop')[0]
                .text
                .trim());
          }
          var today =
              "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";
          WeatherModel weatherModel = WeatherModel(
              date: today,
              today: current,
              weekDays: weekDays,
              days: days,
              tempDay: tempDays,
              tempNight: tempNights,
              feeling: feelings,
              rainPerc: rainPercs);

          data = weatherModel;
          await saveBox<WeatherModel?>('weatherBox', data);
          return data;
        } else {
          return data;
        }
      } catch (e) {
        return data;
      }
    // } else {
    //   return null;
    // }
  }

  var dItems = [
    'Tashkent',
    'Andijan',
    'Bukhara',
    'Gulistan',
    'Jizzakh',
    'Zarafshan',
    'Karshi',
    'Navoi',
    'Namangan',
    'Nukus',
    'Samarkand',
    'Termez',
    'Urgench',
    'Ferghana',
    'Khiva'
  ];

  var zero = true;
  var one = false;
  var two = false;
  var three = false;
  var four = false;
  var five = false;
  var six = false;

  check(int selected) {
    switch (selected) {
      case 0:
        zero = true;
        one = false;
        two = false;
        three = false;
        four = false;
        five = false;
        six = false;
        break;
      case 1:
        zero = false;
        one = true;
        two = false;
        three = false;
        four = false;
        five = false;
        six = false;
        break;
      case 2:
        zero = false;
        one = false;
        two = true;
        three = false;
        four = false;
        five = false;
        six = false;
        break;
      case 3:
        zero = false;
        one = false;
        two = false;
        three = true;
        four = false;
        five = false;
        six = false;
        break;
      case 4:
        zero = false;
        one = false;
        two = false;
        three = false;
        four = true;
        five = false;
        six = false;
        break;
      case 5:
        zero = false;
        one = false;
        two = false;
        three = false;
        four = false;
        five = true;
        six = false;
        break;
      case 6:
        zero = false;
        one = false;
        two = false;
        three = false;
        four = false;
        five = false;
        six = true;
        break;
      default:
    }
  }

  var dropdownValue = 'Ferghana';
  var requestName = 'ferghana';

  Future<bool> loadLocalData() async {
    try {
      var model = await getBox<WeatherModel?>('weatherBox');
      if (model!.date ==
          "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}") {
        data = model;
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: FutureBuilder(
        future: loadData(requestName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Image(image: AssetImage('assets/images/ic_waiting2.gif')),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            /////////////
            return ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xfffef7ff),
                          Color(0xfffcebff),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 25,
                  ),
                  child: Column(
                    children: [
                      mainWeatherTab(),
                      weatherQualityTab(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Haftalik ob-havo ma'lumoti",
                          style: kTextStyle(
                              size: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      weeklyReportTab(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('error'));
          }
        },
      ),
    );
  }

  PreferredSizeWidget customAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xfffef7ff),
                Color(0xfffcebff),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/weather_icons/ic_menu.png',
                  width: 15,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Image(
                        image:
                            AssetImage('assets/weather_icons/ic_location.png'),
                        width: 15,
                        height: 17.48,
                      ),
                      const SizedBox(width: 7.5),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(20),
                          menuMaxHeight: 360,
                          iconSize: 0.0,
                          value: dropdownValue,
                          items: dItems.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: kTextStyle(
                                    size: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue ?? "fergana";
                              requestName = dropdownValue.toLowerCase();
                              check(0);
                              data = WeatherModel();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 30),
                      alignment: Alignment.center,
                      width: 89,
                      height: 22,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xffe662e5), Color(0xff5364f0)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Yangilangan°',
                        style:
                            kTextStyle(size: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.grey),
              child: const Image(
                image: AssetImage('assets/weather_icons/ic_logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainWeatherTab() {
    return SizedBox(
      height: 222,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 202,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  colors: [Color(0xffe662e5), Color(0xff5364f0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff5264F0).withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(10, 15),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 26,
                top: 7,
              ),
              child: Image(
                image: _weatherIcon(data.today?[3].toString().toLowerCase()),
                width: 160,
                height: 160,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 26,
                top: 44,
              ),
              child: RichText(
                text: TextSpan(
                  text: '${data.today?[0].toString().substring(0, 5)}\n',
                  style: kTextStyle(size: 16, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: ' ${data.today?[0].toString().substring(6)}',
                      style: kTextStyle(size: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 21,
                top: 98,
              ),
              child: Column(
                children: [
                  Text(
                    '${data.today?[1]}',
                    style: kTextStyle(size: 60, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Oqshom ${data.today?[2]}',
                    style: kTextStyle(size: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 28,
                bottom: 23,
              ),
              child: Text(
                '${data.today?[3]}',
                style: kTextStyle(size: 26, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget weatherQualityTab() {
    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.only(
        top: 25,
        bottom: 25,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xffFFFFFF)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // const SizedBox(width: 21.92),
              const Image(
                image: AssetImage('assets/weather_icons/quality_air.png'),
                width: 29.17,
                height: 29.17,
              ),
              // const SizedBox(width: 16.92),
              Text(
                'Havo sifati',
                style: kTextStyle(
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff25272E)),
              ),
              // const SizedBox(width: 76),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.5),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: (() => setState(() {})),
                  icon: Image.asset(
                    'assets/weather_icons/ic_refresh.png',
                    width: 14.28,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemInfo(
                      'assets/weather_icons/ic_pressure.png',
                      'Havo bosimi',
                      '${data.today?[6].toString().substring(7, 10)}mm.s.us'),
                  const SizedBox(height: 20),
                  _itemInfo('assets/weather_icons/ic_rain_perc.png', 'Namlik',
                      '${data.today?[4].toString().substring(8)}'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemInfo(
                      'assets/weather_icons/ic_wind.png',
                      'Shamol tezligi',
                      '${data.today?[5].toString().split(",")[1].trim()}'),
                  const SizedBox(height: 20),
                  _itemInfo('assets/weather_icons/ic_moon.png', "Oy ko'rinishi",
                      '${data.today?[7].toString().substring(4)}'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemInfo(
                      'assets/weather_icons/ic_sun_up.png',
                      'Quyosh chiqishi',
                      '${data.today?[8].toString().substring(17)}'),
                  const SizedBox(height: 20),
                  _itemInfo(
                      'assets/weather_icons/ic_sun_down.png',
                      'Quyosh botishi',
                      '${data.today?[9].toString().substring(16)}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget weeklyReportTab() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                check(0);
              });
            },
            child: _itemWeek(
                '${data.weekDays?[0]}',
                '${data.days?[0]}',
                '${data.feeling?[0]}',
                '${data.tempDay?[0]}',
                '${data.rainPerc?[0]}',
                zero),
          ),
          InkWell(
            onTap: () {
              setState(() {
                check(1);
              });
            },
            child: _itemWeek(
                '${data.weekDays?[1]}',
                '${data.days?[1]}',
                '${data.feeling?[1]}',
                '${data.tempDay?[1]}',
                '${data.rainPerc?[1]}',
                one),
          ),
          InkWell(
            onTap: () {
              setState(() {
                check(2);
              });
            },
            child: _itemWeek(
                '${data.weekDays?[2]}',
                '${data.days?[2]}',
                '${data.feeling?[2]}',
                '${data.tempDay?[2]}',
                '${data.rainPerc?[2]}',
                two),
          ),
          InkWell(
            onTap: () {
              setState(() {
                check(3);
              });
            },
            child: _itemWeek(
                '${data.weekDays?[3]}',
                '${data.days?[3]}',
                '${data.feeling?[3]}',
                '${data.tempDay?[3]}',
                '${data.rainPerc?[3]}',
                three),
          ),
          InkWell(
            onTap: () {
              setState(() {
                check(4);
              });
            },
            child: _itemWeek(
                '${data.weekDays?[4]}',
                '${data.days?[4]}',
                '${data.feeling?[4]}',
                '${data.tempDay?[4]}',
                '${data.rainPerc?[4]}',
                four),
          ),
          InkWell(
            onTap: () {
              setState(() {
                check(5);
              });
            },
            child: _itemWeek(
                '${data.weekDays?[5]}',
                '${data.days?[5]}',
                '${data.feeling?[5]}',
                '${data.tempDay?[5]}',
                '${data.rainPerc?[5]}',
                five),
          ),
          InkWell(
            onTap: () {
              setState(() {
                check(6);
              });
            },
            child: _itemWeek(
                '${data.weekDays?[6]}',
                '${data.days?[6]}',
                '${data.feeling?[6]}',
                '${data.tempDay?[6]}',
                '${data.rainPerc?[6]}',
                six),
          ),
        ],
      ),
    );
  }

  Widget _itemInfo(String iconPath, String infoName, String amount) {
    return Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 25,
        ),
        const SizedBox(width: 7),
        RichText(
          text: TextSpan(
            text: '$infoName\n',
            style: kTextStyle(
                size: 10,
                fontWeight: FontWeight.w600,
                color: const Color(0xffCBCBCB)),
            children: [
              TextSpan(
                text: amount,
                style: kTextStyle(
                    size: 10, fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _itemWeek(String shortWeek, String shortDate, String feeling,
      String temp, String perc, bool grd) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: 66,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        gradient: grd
            ? const LinearGradient(
                colors: [
                  Color(0xffE662E5),
                  Color(0xff5364F0),
                ],
                transform: GradientRotation(2 * pi / 13),
              )
            : null,
      ),
      child: Column(
        children: [
          const SizedBox(height: 17),
          Text(
            shortWeek,
            style: kTextStyle(
                size: 12,
                fontWeight: FontWeight.w600,
                color: grd ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 5),
          Text(
            shortDate,
            style: kTextStyle(
                size: 12,
                fontWeight: FontWeight.w600,
                color: grd ? Colors.white : Colors.grey),
          ),
          const SizedBox(height: 13),
          SizedBox(
            width: 40,
            height: 40,
            child: Image(
              image: _weatherIcon(feeling.trim()),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: Text(
              temp,
              style: kTextStyle(
                  size: 22,
                  fontWeight: FontWeight.w600,
                  color: grd ? Colors.white : Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 30,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff2DBE8D),
            ),
            child: Text(
              perc,
              style: kTextStyle(size: 10, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

AssetImage _weatherIcon(String? position) {
  if (position != null) {
    if (position.trim().contains('ochiq havo')) {
      return const AssetImage('assets/weather_icons/ic_sunny.png');
    } else if (position.trim().contains('bulutli')) {
      return const AssetImage('assets/weather_icons/ic_mist.png');
    } else if (position.trim().contains("yomg'ir")) {
      return const AssetImage('assets/weather_icons/ic_drizzle.png');
    } else if (position.trim().contains("chaqmoq")) {
      return const AssetImage('assets/weather_icons/ic_storm.png');
    } else if (position.trim().contains("qor")) {
      return const AssetImage('assets/weather_icons/ic_snow.png');
    }
  }

  return const AssetImage('assets/weather_icons/ic_cloudy.png');
}
