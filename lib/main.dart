import 'package:flutter/material.dart';
import 'package:flutter_batman_networking/movie.dart';
import 'package:flutter_batman_networking/webservices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Movie> _movies = List<Movie>();

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
    final results = await Webservice().loadMovies();
    setState(() {
      _movies = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Movies')),
        body: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(_movies[index].poster),
              title: Text(_movies[index].title),
            );
          },
        ),
      ),
    );
  }
}
