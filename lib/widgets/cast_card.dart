import 'package:flutter/material.dart';

class CastCard extends StatefulWidget {
  final List casts;
  const CastCard({super.key, required this.casts});

  @override
  State<CastCard> createState() => _CastCardState();
}

class _CastCardState extends State<CastCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          const Text("cast",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
            child: ListView.builder(
              itemCount: widget.casts.length,
              itemBuilder: (context, index) {
                return castMovieCard(widget.casts[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget castMovieCard(final Map cast) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 80,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(cast['image']), fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(cast['name'],
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
