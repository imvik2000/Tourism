// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:pathikk/home/detail_page.dart';
import 'package:pathikk/home/headerwithbar.dart';
import 'package:pathikk/widgets/model.dart';

import '../main.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          header_searchbar(size: size),
          const SizedBox(
            height: 25,
          ),
          titlewithmorebutton(
            text: 'Recommended',
            press: () {
              print("works");
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Recommend_list(size: size),
          const SizedBox(
            height: 10,
          ),
          titlewithmorebutton(
            text: 'Featured',
            press: () {
              print("works");
            },
          ),
          // Recommend_list(size: size)

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                featured_crousal(
                  size: size,
                  imageurl:
                      'https://images.unsplash.com/photo-1469820578517-4086c8a154df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGFrZSUyMHZpZXd8ZW58MHx8MHx8&w=1000&q=80',
                ),
                featured_crousal(
                  size: size,
                  imageurl:
                      'https://www.incredibleindia.org/content/dam/incredibleindia/images/places/delhi/delhi-red-fort-0.jpg/_jcr_content/renditions/cq5dam.web.640.480.jpeg',
                ),
                featured_crousal(
                  size: size,
                  imageurl:
                      'https://www.denofgeek.com/wp-content/uploads/2019/02/mcu-1-iron-man.jpg?fit=1200%2C675',
                ),
                featured_crousal(
                  size: size,
                  imageurl:
                      'https://www.denofgeek.com/wp-content/uploads/2019/02/mcu-1-iron-man.jpg?fit=1200%2C675',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class featured_crousal extends StatelessWidget {
  const featured_crousal({
    Key? key,
    required this.size,
    required this.imageurl,
  }) : super(key: key);

  final Size size;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            left: defaultpadding,
            right: defaultpadding,
            top: defaultpadding / 2,
            bottom: defaultpadding / 2),
        height: 185,
        width: size.width * 0.8,
        decoration: BoxDecoration(
           
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageurl),
            )));
  }
}

class Recommend_list extends StatelessWidget {
  Recommend_list({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final List<fam_Items> things = famous_catalog.fitems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 1; i <= things.length - 1; i++)
            (recommend_carousal(
              things: things[i],
              size: size,
              imageLink:
                  'https://res.cloudinary.com/sihau1054/${things[i].images}',
              titleObj: things[i].name,
              press: () {},
            ))
        ],
      ),
    );
  }
}

class recommend_carousal extends StatelessWidget {
  final String titleObj;
  final String imageLink;
  final Function press;
  final fam_Items things;
  const recommend_carousal({
    Key? key,
    required this.titleObj,
    required this.imageLink,
    required this.press,
    required this.things,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultpadding / 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5)),
        boxShadow: [
          BoxShadow(
              color: kprimary.withOpacity(0.5),
              offset: const Offset(0, 5),
              blurRadius: 2.5)
        ],
        color: Colors.black,
      ),
      width: size.width * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            child: Image.network(
              imageLink,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              height: 150,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => details_page(
                            things: things,
                          )));
            },
          ),
          // Image.network(
          //     'https://hips.hearstapps.com/digitalspyuk.cdnds.net/18/14/1522871949-aif12.jpg?crop=1.00xw:0.676xh;0,0.0315xh&resize=480:*'),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => details_page(things: things)));
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              padding: const EdgeInsets.all(defaultpadding / 2),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(
                          text: titleObj,
                          style: Theme.of(context).textTheme.button))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class titlewithmorebutton extends StatelessWidget {
  const titlewithmorebutton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
      child: Row(
        children: [
          Customultext(
            text: text,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              press();
            },
            child: const Text("More"),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kprimary.withOpacity(0.5)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all(const StadiumBorder())),
          )
        ],
      ),
    );
  }
}

class Customultext extends StatelessWidget {
  const Customultext({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: <Widget>[
          Text(text, style: const TextStyle(fontSize: 20)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 7,
              color: kprimary.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
