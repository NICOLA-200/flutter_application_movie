import 'package:flutter/material.dart';
import 'package:flutter_application_movie/data/movie.dart';
import 'package:flutter_application_movie/utils/colors.dart';
import 'package:flutter_application_movie/widgets/cast_card.dart';
import 'package:readmore/readmore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  List<MovieModel> popularItems = List.of(forYouImages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            kBackgroundColor.withOpacity(0.8),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage(popularItems[0].imageAsset.toString()),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dume",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "2021, Denis Villeonom",
                                style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "8.2",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          building('Epic'),
                          SizedBox(
                            width: 10,
                          ),
                          building('Fantasy'),
                          SizedBox(
                            width: 10,
                          ),
                          building("Drama")
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(10),
                        child: ReadMoreText(
                            trimMode: TrimMode.Line,
                            trimLines: 3,
                            moreStyle: TextStyle(color: kButtonColor),
                            lessStyle: TextStyle(
                              color: kButtonColor,
                            ),
                            "data is noion  the doe toeh adjioe meion foeinfoejfheee  hdw  e jfoej e ",
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.5,
                                fontWeight: FontWeight.w500)),
                      ),
                      CastCard(casts: popularItems[0].cast!),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const Text("Trailer",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          image:
                                              AssetImage("assets/trailer.jpeg"),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                    child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.stop,
                                    color: kButtonColor,
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text("commments",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text("see all",
                                    style: TextStyle(
                                        color: kButtonColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            BuildCommentCard(),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 60,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white38),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: kSearchbarColor,
                    )),
              )),
          Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    color: kButtonColor,
                    child: Text(
                      "Watch Movie",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ))
        ],
      ),
    );
  }

  Widget building(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
          color: kSearchbarColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white30, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget BuildCommentCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      height: 160,
      child: ListView.builder(
        itemCount: popularItems[0].comments!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kSearchbarColor),
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(popularItems[0]
                              .comments![index]['imageUrl']
                              .toString()))),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      popularItems[0].comments![index]['name'],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      popularItems[0].comments![index]['date'],
                      style: const TextStyle(color: Colors.white60),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
