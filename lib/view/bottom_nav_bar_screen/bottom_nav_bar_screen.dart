// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/controller/bottom_nav_bar_controller.dart';
import 'package:provider/provider.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavBarController>(context)
          .myPages[Provider.of<BottomNavBarController>(context).selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedFontSize: 0,
          currentIndex:
              Provider.of<BottomNavBarController>(context).selectedIndex,
          onTap: Provider.of<BottomNavBarController>(context, listen: false)
              .onItemTap,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded), label: ""),
          ]),
    );
  }
}
