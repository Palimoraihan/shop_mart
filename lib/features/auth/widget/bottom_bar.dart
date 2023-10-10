import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as bg;
import 'package:shop_mart/constant/constant.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/main-page';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottombarWidth = 42;
  double bottomBarBorderWidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        backgroundColor: GlobalVariables.backgroundColor,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottombarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: bottomBarBorderWidth,
                        color: _page == 0
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor),
                  ),
                ),
                child: const Icon(Icons.home_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottombarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: bottomBarBorderWidth,
                        color: _page == 1
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor),
                  ),
                ),
                child: bg.Badge(
                  badgeContent: Text('3'),
                  child: Icon(Icons.shop_outlined)),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottombarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: bottomBarBorderWidth,
                        color: _page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor),
                  ),
                ),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: ''),
        ],
      ),
    );
  }
}
