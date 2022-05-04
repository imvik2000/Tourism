import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pathikk/utils/store.dart';

class descwid extends StatelessWidget {
  final fam_Items things;
  descwid({Key? key, required this.things}) : super(key: key);
  final _cart = (VxState.store as appstore);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(things.name),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(0, 39, 34, 0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage((things.images != null &&
                            things.images != "")
                        ? 'https://res.cloudinary.com/sihau1054/${things.images}'
                        : 'https://res.cloudinary.com/sihau1054/image/upload/v1648141871/eee_k6kbyq.png')),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 6,
                  // color: Colors.deepPurple[50],
                  child: Column(children: [
                    Html(data: things.description),
                  ]).py32(),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("liked").text.bold.make(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("disliked").text.bold.make(),
              ],
            ),
            const Icon(
              CupertinoIcons.map_fill,
              size: 36,
            )
          ],
        ));
  }
}
