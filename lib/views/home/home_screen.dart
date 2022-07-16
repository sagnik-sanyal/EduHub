import 'package:edu_hub_flutter/constants/size.dart';
import 'package:edu_hub_flutter/views/home/components/catergories_featured.dart';
import 'package:flutter/material.dart';
import '../../constants/color.dart';

class HomeWidget extends StatefulWidget {
  static String route = 'HomeScreen';
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    FeaturedScreen(),
    FeaturedScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            backgroundColor: Colors.white54,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home_rounded,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "Featured",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.leaderboard_rounded,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.leaderboard_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "Progress",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings_rounded,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.settings_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "Settings",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
      ),
    );
  }
}
