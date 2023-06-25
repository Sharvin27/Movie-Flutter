import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingMovies = [];

  List topRatedMovies = [];

  List tv = [];

  final String apikey = 'f3e4c284a84d3be35341d44cce24eeae';

  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmM2U0YzI4NGE4NGQzYmUzNTM0MWQ0NGNjZTI0ZWVhZSIsInN1YiI6IjY0ODllZTk5NmY4ZDk1MDBlNTAxNzE5YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zcSpWwCJ-cs7V8IkcQ7Id_8WG3oMPWs-7kB6mmym3Lw';

  @override
  void initState(){
    loadmovies();
    super.initState();
  
    
  }

  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));

    Map trendinResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    
    setState(() {
      trendingMovies =trendinResult['results'];
      topRatedMovies =topRatedResult['results'];
      tv =tvResult['results'];
    });
    if (kDebugMode) {
      print(trendingMovies);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent ,
        title: const ModifiedText(text: 'Flutter Movie App🎥', color: Color.fromARGB(255, 221, 216, 139), size: 26,),),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRated(toprated: topRatedMovies),
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}