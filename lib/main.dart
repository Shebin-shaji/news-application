// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/controller/bottom_nav_bar_controller.dart';
import 'package:news_app/controller/home_screen_controller.dart';
import 'package:news_app/controller/splash_screen_controller.dart';
import 'package:news_app/view/homeScreen/homeScreen.dart';
import 'package:news_app/view/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:news_app/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavBarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<SplashScreenProvider>(
          builder: (context, splashScreenProvider, _) {
            return splashScreenProvider.isLoading
                ? SplashScreen()
                : BottomNavBarScreen();
          },
        ),
      ),
    );
  }
}