// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_movie/data/movie.dart';
// import 'package:flutter_application_movie/utils/colors.dart';
// import 'package:flutter_application_movie/widgets/custom_card.dart';
// import 'package:flutter_application_movie/widgets/movie_card.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   List<MovieModel> itemList = List.of(forYouImages);
//   List<MovieModel> genresItemList = List.of(genresList);
//   List<MovieModel> popularItemsList = List.of(popularImages);
//   PageController pageController =
//       PageController(initialPage: 0, viewportFraction: 0.9);
//   int currentPage = 0;
//   List tabBarIcons = [
//     Icons.house,
//     Icons.compass_calibration,
//     Icons.search,
//     Icons.explore
//   ];

//     List<MovieModel2> itemList2 = [];
//   bool isLoading = true;


//     @override
//   void initState() {
//     super.initState();
//     fetchMovies();
//   }

//   Future<void> fetchMovies() async {
//     final url = Uri.parse("http://api.tvmaze.com/search/shows?q=all");
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);

//       setState(() {
//         itemList2 = data.map((json) => MovieModel2.fromJson(json)).toList();
//         isLoading = false;
//       });
//     } else {
//       throw Exception("Failed to load shows");
//     }
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: kBackgroundColor,
//         body: Stack(
//           children: [
//             SafeArea(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 30),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Hi Wolcome!",
//                             style: TextStyle(color: Colors.white, fontSize: 30),
//                           ),
//                           Stack(
//                             children: [
//                               Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     image: const DecorationImage(
//                                         image: NetworkImage(
//                                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4CRhPIkiDoOi4o6w3-0yi5u0LcA2YS9mzCg&s"),
//                                         fit: BoxFit.cover)),
//                               ),
//                               Positioned(
//                                   right: 2,
//                                   top: 2,
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.yellow),
//                                     height: 10,
//                                     width: 10,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 30),
//                       child: Container(
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                             color: kSearchbarColor,
//                             borderRadius: BorderRadius.circular(28)),
//                         child: const Row(
//                           children: [
//                             Icon(
//                               Icons.search,
//                               color: Colors.white,
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Text("Search",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     const Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                       child: Text(
//                         "for you",
//                         style: TextStyle(
//                             color: Colors.white54,
//                             fontSize: 28,
//                             fontWeight: FontWeight.w300),
//                       ),
//                     ),
//                     CardsLayout(itemList2),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: kSearchbarColor,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: buildPageIndicatorWidget(),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//                       child: Column(
//                         children: [
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Popular",
//                                 style: TextStyle(
//                                     color: Colors.white54,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w300),
//                               ),
//                               Text(
//                                 "see all all",
//                                 style: TextStyle(
//                                     color: kButtonColor,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w300),
//                               )
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 0),
//                             child: movieListBuilder(popularItemsList),
//                           ),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "genre",
//                                 style: TextStyle(
//                                     color: Colors.white54,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w300),
//                               ),
//                               Text(
//                                 "see all",
//                                 style: TextStyle(
//                                     color: kButtonColor,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w300),
//                               )
//                             ],
//                           ),
//                           genreBuilder(genresList)
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//                 bottom: 35,
//                 left: 25,
//                 right: 25,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
//                     child: Container(
//                       height: 80,
//                       width: MediaQuery.of(context).size.width,
//                       color: kSearchbarColor,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           ...tabBarIcons.map((e) =>
                            
//                              Icon(
//                                 e,
//                                 color: e == Icons.house
//                                     ? Colors.white
//                                     : Colors.white54,
//                                     size: 30,
                              
//                             ) )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ))
//           ],
//         ));
//   }

//  Widget CardsLayout(List<MovieModel2> movieList) {
//   return SizedBox(
//     height: MediaQuery.of(context).size.height * 0.5,
//     child: PageView.builder(
//       physics: const ClampingScrollPhysics(),
//       controller: pageController,
//       itemCount: movieList.length,
//       itemBuilder: (context, index) {
//         return CustomCard(
//           imageAsset: movieList[index].imageUrl,
//           title: movieList[index].name,
          
//         );
//       },
//       onPageChanged: (int page) {
//         setState(() {
//           currentPage = page;
//         });
//       },
//     ),
//   );
// }


//   List<Widget> buildPageIndicatorWidget() {
//     List<Widget> list = [];

//     for (int i = 0; i <= itemList.length; i++) {
//       list.add(i == currentPage ? _indicator(true) : _indicator(false));
//     }

//     return list;
//   }

//   Widget _indicator(bool isActive) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 150),
//       margin: EdgeInsets.symmetric(horizontal: 5),
//       height: 8,
//       width: isActive ? 8 : 8,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: isActive ? Colors.grey : Colors.white),
//     );
//   }

//   Widget movieListBuilder(List<MovieModel> movieList) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//       height: MediaQuery.of(context).size.height * 0.2,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: movieList.length,
//           itemBuilder: (context, index) {
//             return MovieCard(movieModel: movieList[index]);
//           }),
//     );
//   }

//   Widget genreBuilder(List<MovieModel> genresList) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//       height: MediaQuery.of(context).size.height * 0.28,
//       child: ListView.builder(
//           itemCount: genresList.length,
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return Stack(
//               children: [
//                 Container(
//                   width: 250,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                           image: AssetImage(
//                               genresList[index].imageAsset.toString()))),
//                   margin: const EdgeInsets.all(35),
//                 ),
//                 Positioned(
//                     bottom: 0,
//                     left: 10,
//                     child: Text(
//                       genresList[index].movieName.toString(),
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold),
//                     ))
//               ],
//             );
//           }),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_movie/models/movie_model.dart';
import 'package:flutter_application_movie/widgets/movie_card.dart';
import 'package:flutter_application_movie/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<MovieModel>>? movies;

  @override
  void initState() {
    super.initState();
    movies = fetchMovies();
  }

  Future<List<MovieModel>> fetchMovies() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((show) => MovieModel.fromJson(show['show'])).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: const Text('Movies'),
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No shows found'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return MovieCard(movieModel: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
