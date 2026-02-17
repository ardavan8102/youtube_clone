import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/app.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: .light
    )
  );

  runApp(const MyApp());
}