// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pathikk/main.dart';

import '../widgets/model.dart';

class details_page extends StatelessWidget {
  const details_page({
    Key? key,
    required this.things,
  }) : super(key: key);
  final fam_Items things;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: <Widget>[
                Card(
                  elevation: 0,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
                const Spacer(flex: 2),
                Card(
                  elevation: 5,
                  shadowColor: kprimary.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.sunny)),
                ),
                const Spacer(
                  flex: 1,
                ),
                Card(
                  elevation: 5,
                  shadowColor: kprimary.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.thumb_down)),
                ),
                const Spacer(
                  flex: 1,
                ),
                Card(
                  elevation: 5,
                  shadowColor: kprimary.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                ),
                const Spacer(),
              ],
            )),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: kprimary.withOpacity(0.5), blurRadius: 15)
                  ],
                  // ignore: prefer_const_constructors
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(50)),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://res.cloudinary.com/sihau1054/${things.images}'))),
              // child: Image.asset('assets/im.jpg')
            ),
          ],
        ),
      ),
      Card(
        child: Text(
          things.name,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: kprimary, fontWeight: FontWeight.bold),
        ),
      ),
      Card(
        child: Html(data: things.description.toString()),
      )
    ]));
  }
}
