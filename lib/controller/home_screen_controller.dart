import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';


class HomeScreenController with ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;
  var baseUrl = "https://newsapi.org";

  fetchData() async {
    isLoading = true;
    final url =
        "$baseUrl/v2/top-headlines?country=in&apiKey=49fe83b5cf85471f8bd4d35ff3f208a5";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    Map<String, dynamic> decodedData = {}; // map for storing the response
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);

      print(decodedData);
    } else {
      print("Api Failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }

  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print("Error sharing: $e");
    }
  }

  // Future<void> launchUrl(String url) async {
  //   final Uri url1 = Uri.parse(url);
  //   try{
  //     if(!await launchUrl(url1,mode:LaunchMode.inAppWebView)){
  //       launchUrl(url1,mode:LaunchMode.inAppWebView)
  //     }else{
  //       print("couldnot launch");
  //     }

  //   }
  //   catch (e){
  //     print("Error launching url");
  //   }
  //  notifyListeners();
  // }
}
