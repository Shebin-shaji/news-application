// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controller/splash_screen_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(Duration(seconds: 4), () {
      splashScreenProvider.setLoading(false);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "News Feed",
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
