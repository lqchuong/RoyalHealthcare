import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class BottomBar extends StatefulWidget {
  final int indexSelect;
  const BottomBar({Key? key,
  required this.indexSelect}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        Get.toNamed(Routes.MAIN);
      }
      if (_currentIndex == 1) {
        Get.toNamed(Routes.USERPAGE);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return  BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: widget.indexSelect,
    backgroundColor: Colors.blue,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white.withOpacity(.40),
    selectedLabelStyle: textTheme.caption,
    unselectedLabelStyle: textTheme.caption,
    onTap: (value) {
    // Respond to item press.
    // setState(() => _currentIndex = value);
    _onItemTapped(value);
    },
    items: const [
    BottomNavigationBarItem(
    label: 'Trang chủ',
    icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
    label: 'User',
    icon: Icon(Icons.calendar_month),
    ),
    BottomNavigationBarItem(
    label: 'Cài đặt',
    icon: Icon(Icons.settings),
    ),

    ],
    );
  }
}
