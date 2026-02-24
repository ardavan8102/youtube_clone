import 'package:flutter/material.dart';
import 'package:youtube_clone/core/consts/dimens.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: .fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow_outlined),
          label: 'Shorts',
        ),

        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle_outline,
            size: AppDimens.iconSizeLarge,
          ),
          label: 'Add',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: 'Search',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Account',
        ),
      ],
    );
  }
}