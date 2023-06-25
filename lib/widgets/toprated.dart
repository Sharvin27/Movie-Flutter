import "package:flutter/material.dart";
import "package:movie_app/utils/text.dart";

import "../description.dart";

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});

  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(text: 'Top Rated', size: 22, color: Color.fromARGB(255, 255, 255, 255) ,),
          const SizedBox(height: 10,),
          SizedBox(height: 255,
          child: ListView.builder(itemCount: toprated.length,
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Description(
                    name: toprated[index]['title'] ?? 'Loading', 
                    description: toprated[index]['overview'], 
                    bannerurl: 'https://image.tmdb.org/t/p/w300'+toprated[index]['backdrop_path'], 
                    posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'], 
                    vote: toprated[index]['vote_average'].toString(), 
                    launch: toprated[index]['release_date'] ?? 'No Date',)));
                },
                child: toprated[index]['title'] != null ?SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                             ))),
                      ),
                      Container(
                        child: ModifiedText(text: toprated[index]['title'] ?? 'Loading',
                         color:const Color.fromARGB(255, 152, 140, 34),
                          size: 13),
                      )
                    ],
                  ),
                ): Container(),

              );
            }),)
        ],
      ),
    );
  }
}