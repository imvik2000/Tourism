import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pathikk/home/homebody.dart';
import 'package:pathikk/main.dart';
import 'package:pathikk/widgets/Home.dart';
import 'package:pathikk/widgets/MainDrawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/model.dart';
import '../widgets/search.dart';

class home2 extends StatefulWidget {
  const home2({Key? key}) : super(key: key);

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

//loading data from json files/apis

  loaddata() async {
    await Future.delayed(const Duration(seconds: 2));
    const url_items = "http://localhost:8000/api/famous/";
    const url_locations = "http://localhost:8000/api/location/";

    var response = await http.get(Uri.parse(url_items));
    var jsoitem = response.body;
    var itemData = jsonDecode(jsoitem);

    var response2 = await http.get(Uri.parse(url_locations));
    var jsolocation = response2.body;
    var locsData = jsonDecode(jsolocation);

    famous_catalog.fitems = List.from(itemData)
        .map<fam_Items>((items) => fam_Items.fromMap(items))
        .toList();

    astd_location.flocs = List.from(locsData)
        .map<locations>((locationx) => locations.fromMap(locationx))
        .toList();
    setState(() {});
    print(famous_catalog.fitems[3].name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: customsearchdelegate());
              },
              icon: const Icon(Icons.search))
        ],
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset("menu.svg"));
        }),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            if (famous_catalog.fitems[0].id != "default")
              const Body().expand()
            else
              const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.account_circle)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: const Icon(Icons.list)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.library_add_sharp)),
          ],
        ),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: kprimary)],
          color: kprimary,
        ),
      ),
    );
  }

  AppBar appbarbuilder() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            print("pressed");
            Scaffold.of(context).openDrawer();
          },
          icon: SvgPicture.asset("menu.svg")),
      elevation: 0,
    );
  }
}

class mydrawer extends StatelessWidget {
  const mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: MainDrawer(),
    );
  }
}
