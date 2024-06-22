// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controller/home_screen_controller.dart';
import 'package:news_app/view/homeScreen/widgets/home_page_news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Text("News Feed",
            textAlign: TextAlign.start,
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 29,
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Consumer<HomeScreenController>(builder: (context, provider, child) {
        return provider.isLoading == true
            ? Center(child: CircularProgressIndicator())
            : SizedBox(
                height: double.maxFinite,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: provider.newsModel.articles?.length ?? 0,
                    itemBuilder: (context, index) => HomePageNewsCard(
                          title: provider.newsModel.articles?[index].title
                                  .toString() ??
                              "",
                          description: provider
                                  .newsModel.articles?[index].description
                                  .toString() ??
                              "",
                          imageUrl: provider
                                  .newsModel.articles?[index].urlToImage
                                  .toString() ??
                              "",
                          content: provider.newsModel.articles?[index].content
                                  .toString() ??
                              "",
                          sourceName: provider.newsModel.articles?[index].source
                                  .toString() ??
                              "",
                          date: provider.newsModel.articles?[index].publishedAt,
                          category: provider.newsModel.articles?[index].content
                                  .toString() ??
                              "",
                        )),
              );
      }),
    );
  }
}
