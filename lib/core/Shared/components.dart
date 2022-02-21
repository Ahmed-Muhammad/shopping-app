// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
//
// Widget articleBuilder(list) => ConditionalBuilder(
//       condition: list.length > 0,
//       fallback: (context) => const Center(child: CircularProgressIndicator()),
//       builder: (context) => ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         itemCount: 8,
//         separatorBuilder: (context, index) => const Padding(
//             padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//             child: Divider(
//                 color: Colors.grey, endIndent: .5, thickness: 1, height: 5)),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//       ),
//     );
//
// Widget articleBuilder2(list, context, {isSearch = false}) => ConditionalBuilder(
//       condition: list.length > 0,
//       builder: (context) => ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: 10,
//       ),
//       fallback: (context) => isSearch
//           ? Container()
//           : const Center(child: CircularProgressIndicator()),
//     );
//
// Widget buildTappedArticleItem(article, context) => InkWell(
//       onTap: () {},
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           children: [
//             Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(article['urlToImage'] ?? "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg")),
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: SizedBox(
//                 height: 120,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',
//                         style: Theme.of(context).textTheme.bodyText1,
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',
//                       style: const TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//
// Widget buildArticleItem(article, context) => Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Row(
//         children: [
//           Container(
//             width: 120.0,
//             height: 120.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(
//                 10.0,
//               ),
//               image: DecorationImage(
//                 image: NetworkImage('${article['urlToImage']}'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 20.0,
//           ),
//           Expanded(
//             child: SizedBox(
//               height: 120.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       '${article['title']}',
//                       style: Theme.of(context).textTheme.bodyText1,
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Text(
//                     '${article['publishedAt']}',
//                     style: const TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 15.0,
//           ),
//         ],
//       ),
//     );
//
// Widget defaultFormField({
//   required TextEditingController controller,
//   TextInputType? type,
//   Function(String)? onSubmit,
//   Function(String)? onChanged,
//   GestureTapCallback? onTap,
//   required String? Function(String?)? validate,
//   required String? label,
//   required IconData? prefix,
//   bool isClickable = true,
// }) =>
//     TextFormField(
//       enabled: isClickable,
//       controller: controller,
//       keyboardType: type,
//       onFieldSubmitted: onSubmit,
//       onChanged: onChanged,
//       onTap: onTap,
//       validator: validate,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(prefix),
//         border: const OutlineInputBorder(),
//       ),
//     );
//
// Widget myDivider() => Padding(
//       padding: const EdgeInsetsDirectional.only(
//         start: 20.0,
//       ),
//       child: Container(
//         width: double.infinity,
//         height: 1.0,
//         color: Colors.grey[300],
//       ),
//     );
//
// void navigateTo(context, widget) => Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => widget,
//       ),
//     );