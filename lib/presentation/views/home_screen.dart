import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_clone/core/consts/dimens.dart';
import 'package:youtube_clone/core/extensions/sized_box.dart';
import 'package:youtube_clone/features/helpers/handle_request.dart';
import 'package:youtube_clone/features/models/video_model.dart';
import 'package:youtube_clone/features/services/youtube_api.dart';
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

  final YoutubeApiService _youtubeApiService = YoutubeApiService();
  
  late List<VideoModel> videos;

  @override
  void initState() {
    super.initState();
    _loadVideos();
  }


  Future<void> _loadVideos() async {
    await handleRequest(
      () async {
        videos = await _youtubeApiService.fetchVideos();
        log('videos count : ${videos.length}');
      }
    );
  }

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