import 'package:flutter/material.dart';
import 'package:youtube_clone/core/consts/dimens.dart';
import 'package:youtube_clone/core/extensions/sized_box.dart';
import 'package:youtube_clone/presentation/widgets/lists/categorywise_list.dart';
import 'package:youtube_clone/presentation/widgets/main_widgets/app_bar.dart';
import 'package:youtube_clone/presentation/widgets/main_widgets/bottom_navbar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    //TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomTopAppBarWidget(),
      bottomNavigationBar: BottomNavbarWidget(),
      body: Center(
        child: Column(
          children: [
            // categories
            CategoryListView(
              categories: [
                'All',
                'Movies',
                'Games',
                'Theatre',
                'Comedy'
              ],
              selectedIndex: selectedCategoryIndex,
              onCategoryChanged: (index) {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
            ),

            AppDimens.marginSmall.height,

            Text(
              'Home Screen'
            ),
          ],
        ),
      ),
    );
  }
}