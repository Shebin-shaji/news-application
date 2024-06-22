// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePageNewsCard extends StatelessWidget {
  const HomePageNewsCard(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.content,
      required this.sourceName,
      this.date,
      required this.category});
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String sourceName;
  final DateTime? date;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        width: 400,
        height: 450,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.6),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  width: 400,
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  DateFormat('dd/MM/yyyy')
                                      .format(date!)
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 19),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share),
                              color: Colors.white,
                              iconSize: 26,
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          category,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          description,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
