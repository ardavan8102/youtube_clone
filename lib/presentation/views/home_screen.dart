import 'package:flutter/material.dart';
import 'package:youtube_clone/presentation/widgets/main_widgets/app_bar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomTopAppBarWidget(),
      body: Center(
        child: Text(
          'Home Screen'
        ),
      ),
    );
  }
}