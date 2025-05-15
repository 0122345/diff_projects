import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Header with auth
          Row(
            children: [
              Image.asset(),
              Column(children:[ 
                Text("Good morning"),
                Text("Ntwari Ashimwe Fiacre"),
              ],),
              const SizedBox(width: 22),
            ],
          ),

          //Search
          
          //
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround, 
            children:[
              Text("Our Services"),
              Text("See All"),
            ],
          ),

          //SCard lides
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [1,2,3,4,5].map((i) {
                 return Builder(
                  builder: (BuildContext context) {
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  }
                 );
              }).toList(),
            ),
        ],
      );
    );
  }
}


//TODO:See what to add from here
// CarouselSlider(
//    items: items,
//    options: CarouselOptions(
//       height: 400,
//       aspectRatio: 16/9,
//       viewportFraction: 0.8,
//       initialPage: 0,
//       enableInfiniteScroll: true,
//       reverse: false,
//       autoPlay: true,
//       autoPlayInterval: Duration(seconds: 3),
//       autoPlayAnimationDuration: Duration(milliseconds: 800),
//       autoPlayCurve: Curves.fastOutSlowIn,
//       enlargeCenterPage: true,
//       enlargeFactor: 0.3,
//       onPageChanged: callbackFunction,
//       scrollDirection: Axis.horizontal,
//    )
//  )