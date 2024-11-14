import 'package:flutter/material.dart';
import 'package:flutter_application_movie/models/movie_model.dart';
import 'package:flutter_application_movie/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<MovieModel> _allMovies = []; // You should fetch your movie data here
  List<MovieModel> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    // Initialize with some data (In your case, fetch from API)
    _allMovies = _getDummyMovies(); // Replace with actual data fetching
    _filteredMovies = _allMovies;
  }

  // Dummy movies data, replace with actual API data
  List<MovieModel> _getDummyMovies() {
    return [
      MovieModel(movieName: 'All American', imageUrl: 'https://static.tvmaze.com/uploads/images/original_untouched/425/1064746.jpg', year: '2018', movieRating: '6.0', genres: ['Drama', 'Sports'], summary: 'A drama about football players.'),
      MovieModel(movieName: 'Stranger Things', imageUrl: 'https://static.tvmaze.com/uploads/images/original_untouched/1/3707.jpg', year: '2016', movieRating: '8.8', genres: ['Drama', 'Fantasy'], summary: 'A group of kids discovers supernatural events in their small town.'),
      // Add more dummy movies or use your actual API data
    ];
  }

  void _filterMovies(String query) {
    List<MovieModel> filteredMovies = _allMovies
        .where((movie) =>
            movie.movieName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredMovies = filteredMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              onChanged: _filterMovies,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for a movie...',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Movie list
            Expanded(
              child: ListView.builder(
                itemCount: _filteredMovies.length,
                itemBuilder: (context, index) {
                  MovieModel movie = _filteredMovies[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(movieModel: movie),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      color: Colors.grey[850],
                      child: ListTile(
                        leading: Image.network(
                          movie.imageUrl!,
                          width: 50,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          movie.movieName!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          movie.year ?? 'N/A',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
