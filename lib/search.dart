// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(actions: [
//       IconButton(
//           onPressed: () {
//             showSearch(context: context, delegate: MySearch());
//           },
//           icon: Icon(
//             Icons.search,
//             size: 40,
//           ))
//     ]));
//   }
// }

// class MySearch extends SearchDelegate {
//   late List<String> searchResults = [
//     'suggest',
//     'china',
//     'china',
//     'china',
//     'china',
//   ];
//   late VoidCallback clickItem;
//   @override
//   List<Widget>? buildActions(BuildContext context) => [
//         IconButton(
//             onPressed: () {
//               if (query.isEmpty) {
//                 close(context, null);
//               } else {
//                 query = '';
//               }
//             },
//             icon: const Icon(Icons.clear))
//       ];

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           return close(context, null);
//         },
//         icon: Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Center(
//       child: Text(
//         query,
//         style: const TextStyle(
//           fontSize: 44,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // List<String> suggestions = searchResults.where((searchResult) {
//     //   final result = searchResult.toLowerCase();
//     //   final input = query.toLowerCase();
//     //   return result.contains(input);
//     // }).toList ;
//     // return ListView.builder(
//     //   itemBuilder: (context, index) {
//     //     final suggestion = suggestions[index];
//     //     return ListTile(
//     //       title: Text(suggestion),
//     //       onTap: () {
//     //         query = suggestion;
//     //         showResults(context);
//     //       },
//     //     );
//     //   },
//     //   itemCount: suggestions.length,
//     // );
//   }
// }
