import "package:flutter/material.dart";
import "package:movie_app/utils/text.dart";

import "../description.dart";

class TV extends StatelessWidget {
  const TV({super.key, required this.tv});

  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(text: 'TV', size: 22, color: Color.fromARGB(255, 255, 255, 255) ,),
          const SizedBox(height: 10,),
          SizedBox(height: 190,
          child: ListView.builder(itemCount: tv.length,
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Description(
                    name: tv[index]['name'] ?? 'Loading', 
                    description: tv[index]['overview'], 
                    bannerurl: 'https://image.tmdb.org/t/p/w1280'+tv[index]['backdrop_path'], 
                    posterurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'], 
                    vote: tv[index]['vote_average'].toString(), 
                    launch: tv[index]['release_date'] ?? 'No Date',)));
                },
                child: 
                  // ignore: prefer_interpolation_to_compose_strings
                  tv[index]['backdrop_path'] != null ?Container(
                  padding: const EdgeInsets.all(5),
                  width: 250,
                  child: Column(
                    children: [
                      Container(
                        
                        height: 140,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: tv[index]['backdrop_path'] != null 
                            ? NetworkImage(
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w1280'+tv[index]['backdrop_path']
                             // ignore: prefer_interpolation_to_compose_strings
                             ) : NetworkImage('https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']),
                             fit: BoxFit.cover)),
                      ), 
                      SizedBox(height: 5,),     
                      Container(
                        child: ModifiedText(text: tv[index]['name'] ?? 'Loading',
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