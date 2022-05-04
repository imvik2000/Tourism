import 'package:flutter/material.dart';
import 'package:pathikk/widgets/Homewids.dart';
import 'package:pathikk/widgets/Item_desc.dart';
import 'package:pathikk/widgets/listbytown.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';

class customsearchdelegate extends SearchDelegate {
  List<locations> city = astd_location.flocs;
  List<fam_Items> things = famous_catalog.fitems;

  // List<String> searchitems = [
  //   'bhopal',
  //   'khurai',
  //   'sagar',
  //   'bina',
  //   'sanchi',
  //   'jabalpur',
  //   'indore',
  //   'delhi'
  // ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

///////////////////////////////////////////////////////////////////////
  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsetsDirectional.all(40),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text("Nothing matched with " + query).text.xl3.coolGray100.make(),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var place in city) {
      if (place.locs.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(place.locs);
      }
    }
    bool isitem = false;
    for (var item in things) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            if (things.indexWhere(
                    (element) => element.name == matchQuery[index]) !=
                -1) {
              return descwid(
                  things: things[things.indexWhere(
                      (element) => element.name == matchQuery[index])]);
            } else {
              return Itemlisterbyname(city: matchQuery[index]);
            }
          })),
          title: Text(matchQuery[index]),
        );
      },
    );
  }
}
