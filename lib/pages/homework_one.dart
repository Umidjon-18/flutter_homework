import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeworkOne extends StatefulWidget {
  const HomeworkOne({Key? key}) : super(key: key);

  @override
  State<HomeworkOne> createState() => _HomeworkOneState();
}

class _HomeworkOneState extends State<HomeworkOne> {
  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(),
      body: ListView(
        children: [
          Expanded(
            child: Container(
              height: 429,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 67, 66, 66),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    width: 230,
                    height: 230,
                    child: const Center(
                        child: Image(
                      image: AssetImage('assets/images/ellipse.png'),
                      color: Colors.red,
                    )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _smallCard('Active subs', '12'),
                      _smallCard('Highest subs', '\$19.99'),
                      _smallCard('Lowest subs', '\$5.99'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 21, bottom: 12),
                  color: Colors.black,
                  width: 327,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8.5,
                      ),
                      Container(
                        width: 155,
                        height: 36,
                        decoration: BoxDecoration(
                          color: _hasBeenPressed1
                              ? const Color.fromARGB(255, 47, 45, 45)
                              : Colors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextButton(
                          onPressed: () => {
                            setState(() {
                              _hasBeenPressed1 = !_hasBeenPressed1;
                              _hasBeenPressed2 = !_hasBeenPressed2;
                            })
                          },
                          child: Text(
                            'Your subscriptions',
                            style: TextStyle(
                              color: _hasBeenPressed1
                                  ? Colors.grey[400]
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 155,
                        height: 36,
                        decoration: BoxDecoration(
                          color: _hasBeenPressed2
                              ? const Color.fromARGB(255, 47, 45, 45)
                              : Colors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextButton(
                          onPressed: () => {
                            setState(() {
                              _hasBeenPressed2 = !_hasBeenPressed2;
                              _hasBeenPressed1 = !_hasBeenPressed1;
                            })
                          },
                          child: Text(
                            'Upcoming bills',
                            style: TextStyle(
                              color: _hasBeenPressed2
                                  ? Colors.grey[400]
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
                _longCard('Spotify', '\$5.99'),
              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: AnimatedBottomNavigationBar(
        bottomBarItems: const [
          BottomBarItemsModel(
            icon: Icon(Icons.home, size: 24),
            iconSelected:
                Icon(Icons.home, color: AppColors.cherryRed, size: 24),
            title: 'Home',
            dotColor: Colors.red,
          ),
          BottomBarItemsModel(
            icon: Icon(Icons.search, size: 24),
            iconSelected:
                Icon(Icons.search, color: AppColors.cherryRed, size: 24),
            title: 'Search',
            dotColor: Colors.red,
          ),
          BottomBarItemsModel(
            icon: Icon(Icons.person, size: 24),
            iconSelected:
                Icon(Icons.person, color: AppColors.cherryRed, size: 24),
            title: 'Person',
            dotColor: Colors.red,
          ),
          BottomBarItemsModel(
            icon: Icon(Icons.settings, size: 24),
            iconSelected:
                Icon(Icons.settings, color: AppColors.cherryRed, size: 24),
            title: 'Settings',
            dotColor: Colors.red,
          ),
        ],
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: Colors.red,
          centerIcon: const FloatingCenterButton(
            child: Icon(
              Icons.add,
              color: AppColors.white,
              size: 30,
            ),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.home,
                color: AppColors.white,
              ),
              onTap: () {},
            ),
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.favorite,
                color: AppColors.white,
              ),
              onTap: () {},
            )
          ],
        ),
      ),
      //other params
    );
  }
}

Widget _smallCard(String title, String amount) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20, left: 4, right: 4),
    width: 104,
    height: 68,
    decoration: BoxDecoration(
      color: Colors.grey[600],
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 12,
              color: Colors.grey[300],
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          amount,
          style: TextStyle(
              fontSize: 14,
              color: Colors.grey[300],
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget _longCard(String activity, String price) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    width: 360,
    height: 65,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white70,
        width: 0.3,
      ),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 15,
                left: 10,
              ),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jun',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    '25',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              activity,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: Text(
            price,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
