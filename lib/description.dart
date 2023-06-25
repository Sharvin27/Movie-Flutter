import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';


class Description extends StatelessWidget {
  const Description({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch});

  final String name, 
  description,
  bannerurl,
  posterurl,
  vote,
  launch;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(bannerurl, fit:BoxFit.cover,),
                )),
                Positioned(
                  bottom: 10,
                  child: ModifiedText(text: '⭐Average Rating - $vote', color: Colors.white, size: 18,))
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(
              text: name , color: Colors.white, size: 26,),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: ModifiedText(text: 'Releasing On - $launch' , color: Colors.white, size: 15),
            
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 250,
                width: 140,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: ModifiedText(text: description, color: Colors.white, size: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}