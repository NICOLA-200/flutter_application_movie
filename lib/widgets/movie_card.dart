import 'package:flutter/material.dart';
import 'package:flutter_application_movie/data/movie.dart';

class MovieCard extends StatelessWidget {
  MovieModel movieModel;
   MovieCard({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: 200,
          width: 140,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(colors: 
            [
              Colors.black.withOpacity(0.8),
              Colors.transparent
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter
            )
          ),
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: 
            AssetImage(movieModel.imageAsset!),fit: BoxFit.cover)
          ),
        ),
        Positioned(
            left: 15,
           
            bottom: 2,
             top: 0,
            right: 15,
          child: 
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Expanded(child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movieModel.movieName!,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight:  FontWeight.bold
                ),),
                const SizedBox(
                  height: 5,
                ),

                Text(movieModel.year! ,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight:  FontWeight.bold
                ),),

                SizedBox(
                  height: 5,
                )
              ],
            )),
            SizedBox(
              width: 28,
            ),
            Row(
              children: [
                Text(movieModel.movieRating!,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(
                  width: 5,
                ),const Icon(Icons.star, color: Colors.yellow, size: 15,)
              ],
            )
          ],
        ))
      ],
    );
  }
}
