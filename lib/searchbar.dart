// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SearchWidget extends StatelessWidget {
//   const SearchWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(actions: [
//         IconButton(
//           onPressed: () {
//             showSearch(context: context, delegate: Search());
//           },
//           icon: Icon(Icons.search),
//         ),
//       ]),
//     );
//   }
// }

// class Search extends SearchDelegate {
//   List<String> searchResults = ['brazil', 'china', 'inda', 'usa'];
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     IconButton(
//       icon: Icon(Icons.clear),
//       onPressed: () {
//         if (query.isEmpty) {
//           close(context, null);
//         } else {
//           query = '';
//         }
//       },
//     );
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Center(
//       child: Text(
//         query,
//         style: const TextStyle(fontSize: 44),
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestions = searchResults.where((searchResult) {
//       final result = searchResult.toLowerCase();
//       final input = query.toLowerCase();
//       return result.contains(input);
//     }).toList;
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         final suggestion = suggestions[index];
//         return ListTile(
//           title: Text(suggestion),
//           onTap: () {
//             query = suggestion;
//             showResults(context);
//           },
//         );
//       },
//       itemCount: suggestions.length,
//     );
//   }
// }
