import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/core/consts/colors.dart';
import 'package:youtube_clone/core/consts/dimens.dart';
import 'package:youtube_clone/core/extensions/sized_box.dart';
import 'package:youtube_clone/gen/assets.gen.dart';
import 'package:youtube_clone/presentation/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _logoScale = 0.0;
  double _brandNameOpacity = 0.0;
  Offset _outdoorOffset = Offset(0, 50);

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _navigateToHome();
  }

  void _navigateToHome() {

    Timer(
      const Duration(seconds: 6),
      () {
        Navigator.pushReplacement(
          context,
          CupertinoDialogRoute(builder: (_) => HomePageScreen(), context: context)
        );
      },
    );

  }

  void _initAnimations() {
    Future.delayed(
      const Duration(milliseconds: 250), () {
        setState(() {
          _logoScale = 1.0;
        });
      }
    );

    Future.delayed(
      const Duration(milliseconds: 1500), () {
        setState(() {
          _brandNameOpacity = 1.0;
        });
      }
    );

    Future.delayed(
      const Duration(milliseconds: 1000), () {
        setState(() {
          _outdoorOffset = Offset(0, 0);
        });
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            AnimatedScale(
              scale: _logoScale,
              duration: const Duration(seconds: 1),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Image.asset(
                  Assets.img.youtubeLogo.path,
                  width: AppDimens.splashScreenLogoSize,
                  height: AppDimens.splashScreenLogoSize,
                  fit: .cover,
                ),
              ),
            ),

            AppDimens.marginMedium.height,

            AnimatedOpacity(
              opacity: _brandNameOpacity, 
              duration: const Duration(seconds: 2),
              child: Text(
                'Youtube Clone',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),

            AppDimens.marginSmall.height,
            
            AnimatedSlide(
              offset: _outdoorOffset, 
              duration: const Duration(seconds: 3),
              child: Text(
                'by Ardavan Eskandari',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}