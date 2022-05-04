import 'package:flutter/material.dart';

import '../main.dart';

class header_searchbar extends StatelessWidget {
  const header_searchbar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                left: defaultpadding, right: defaultpadding),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
                color: kprimary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: Row(
              children: [
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     right: 0,
          //     child: Container(
          //       height: 54,
          //       margin: const EdgeInsets.symmetric(horizontal: 20),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           color: Colors.white,
          //           boxShadow: [
          //             BoxShadow(
          //                 offset: const Offset(0, 10),
          //                 blurRadius: 50,
          //                 color: kprimary.withOpacity(0.2))
          //           ]),
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Row(
          //           children: [
          //             Expanded(
          //               child: TextField(
          //                 decoration: InputDecoration(
          //                   hintText: "search",
          //                   hintStyle:
          //                       TextStyle(color: kprimary.withOpacity(0.2)),
          //                   enabledBorder: InputBorder.none,
          //                   focusedBorder: InputBorder.none,
          //                 ),
          //               ),
          //             ),
          //             GestureDetector(
          //               child: SvgPicture.asset("search.svg"),
          //               onTap: () {},
          //             )
          //           ],
          //         ),
          //       ),
          //     ))
        ],
      ),
    );
  }
}
