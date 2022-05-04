// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:pathikk/home/detail_page.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';

class Itemlisterbyname extends StatelessWidget {
  const Itemlisterbyname({
    Key? key,
    required this.city,
  }) : super(key: key);
  final String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(city.toString())),
      body: Itemlisterbyname2(matchit: city),
    );
  }
}

class Itemlisterbyname2 extends StatelessWidget {
  const Itemlisterbyname2({
    Key? key,
    required this.matchit,
  }) : super(key: key);

  final String matchit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: famous_catalog.fitems.length,
      itemBuilder: (BuildContext context, int index) {
        final fam_Items things = famous_catalog.fitems[index];
        locations location = astd_location.flocs[0];
        for (var a in astd_location.flocs) {
          if (things.location == a.id) {
            location = a;
          }
        }

        if (location.locs.toLowerCase() == matchit.toLowerCase()) {
          return listcard1(things: things);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class listcard1 extends StatelessWidget {
  final things;

  const listcard1({Key? key, required this.things}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => details_page(
                      things: things,
                    ))),
        child: Card(
            color: const Color.fromARGB(255, 39, 34, 34),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.15,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(0, 39, 34, 0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage((things.images != null &&
                              things.images != "")
                          ? 'https://res.cloudinary.com/sihau1054/${things.images}'
                          : 'https://res.cloudinary.com/sihau1054/image/upload/v1648141871/eee_k6kbyq.png')),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(things.name.toString())
                      .text
                      .bold
                      .color(Colors.yellow)
                      .make(),
                  Text(things.name.toString()).text.color(Colors.yellow).make(),
                  Wrap(
                    spacing: 12.0,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 4.0,
                        children: [
                          const Icon(Icons.thumb_up_alt_rounded),
                          Text(things.likes.length.toString()).text.bold.make(),
                        ],
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 4.0,
                        children: [
                          const Icon(Icons.thumb_down_alt_rounded),
                          Text(things.dislikes.length.toString())
                              .text
                              .bold
                              .make(),
                        ],
                      ),
                    ],
                  ),
                  (things.description != null && things.description != "")
                      ? const Text("No description")
                          .text
                          .color(Colors.yellow)
                          .make()
                      : const Text("No description")
                          .text
                          .color(Colors.yellow)
                          .make(),
                ],
              ))
            ])),
      ),
    );
  }
}
