import "package:flutter/material.dart";
import "package:movie_app/description.dart";
import "package:movie_app/utils/text.dart";

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(text: 'Trending Movies', size: 22, color: Color.fromARGB(255, 242, 242, 242) ,),
          const SizedBox(height: 10,),
          SizedBox(height: 260,
          child: ListView.builder(itemCount: trending.length,
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Description(
                    name: trending[index]['title'] ?? 'Loading', 
                    description: trending[index]['overview'], 
                    bannerurl: 'https://image.tmdb.org/t/p/w300'+trending[index]['backdrop_path'], 
                    posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'], 
                    vote: trending[index]['vote_average'].toString(), 
                    launch: trending[index]['release_date'] ?? 'No Date',)));
                },
                child: 
                trending[index]['title'] != null ?SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                             ))),
                      ),
                      Container(
                        child: ModifiedText(text: trending[index]['title'] ?? 'Loading',
                         color:Color.fromARGB(255, 152, 140, 34),
                          size: 13),
                      )
                    ],
                  ),
                ):Container(),

              );
            }),)
        ],
      ),
    );
  }
}