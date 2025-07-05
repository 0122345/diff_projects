import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:todo/controllers/card.dart';

// // ignore: must_be_immutable
// class Services extends StatelessWidget {
//   List<CardItem> cardItems = [
//     CardItem(
//       imageUrl: 'https://picsum.photos/500/300?random=1',
//       title: 'Card 1',
//       description: 'Description for Card 1',
//     ),
//     CardItem(
//       imageUrl: 'https://picsum.photos/500/300?random=2',
//       title: 'Card 2',
//       description: 'Description for Card 2',
//     ),
//     CardItem(
//       imageUrl: 'https://picsum.photos/500/300?random=3',
//       title: 'Card 3',
//       description: 'Description for Card 3',
//     ),
//     CardItem(
//       imageUrl: 'https://picsum.photos/500/300?random=4',
//       title: 'Card 4',
//       description: 'Description for Card 4',
//     ),
//     CardItem(
//       imageUrl: 'https://picsum.photos/500/300?random=5',
//       title: 'Card 5',
//       description: 'Description for Card 5',
//     ),
//   ];

//     Services({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           //Header with auth
//           Row(
//             children: [
//               Image.asset(""),
//               Column(
//                 children: [Text("Good morning"), Text("Ntwari Ashimwe Fiacre")],
//               ),
//               const SizedBox(width: 22),
//             ],
//           ),

//           //Search

//           //
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [Text("Our Services"), Text("See All")],
//           ),

//           //Card slides
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 400.0,
//               aspectRatio: 16 / 9,
//               enlargeCenterPage: true,
//               enableInfiniteScroll: false,
//               scrollPhysics: BouncingScrollPhysics(),
//               initialPage: 0,
//             ),
//             items: CardItems.map((item) {
//               return GestureDetector(
//                 // onTap: () {
//                 //   Navigator.push(
//                 //     context, 
//                 //     MaterialPageRoute(
//                 //       builder: (context) => screen())
//                 //       ),),
//                 // },
//               );
//             },
//             child: Card(
//               margin: EdgeInsets.symmetric(horizontal: 10.0),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               elevation: 5,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15.0),
//                 child: Column(
//                   children: [
//                     Expanded(child:  Image.network(
//                       item.imageUrl,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                      ),
//                     ),
                    
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         item.title,
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),

//                      Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               item.description, // Description text for each card
//                               style: TextStyle(
//                                 fontSize: 14.0,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                           ),
//                   ],
//                 ),
//               ),
//             ),
//             ).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class CardDetailScreen extends StatelessWidget {
//   final CardItem item;

//   CardDetailScreen({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(item.title)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.network(item.imageUrl),
//             SizedBox(height: 20),
//             Text(
//               item.title,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 item.description,
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



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

  