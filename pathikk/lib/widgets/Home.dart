import 'package:flutter/material.dart';
import 'package:pathikk/widgets/Homewids.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:pathikk/widgets/search.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/store.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

// main frontend widget//
  final _cart = (VxState.store as appstore);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pathik"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: customsearchdelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            if (famous_catalog.fitems[0].id != "default")
              const Itemlister().expand()
            else
              const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
