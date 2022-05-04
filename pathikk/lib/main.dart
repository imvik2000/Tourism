import 'package:flutter/material.dart';
import 'package:pathikk/utils/store.dart';
import 'package:pathikk/widgets/Home.dart';
import 'package:pathikk/widgets/login.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home/newhome.dart';

void main() {
  runApp(VxState(store: appstore(), child: const MainApp()));
}

var kprimary = const Color(0xFF0C9869);

var ktextcolor = const Color(0xFF3C4046);
var kbgcolor = const Color(0xFFF9F8FD);
const double defaultpadding = 20.0;

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xFF0C9869, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF0C9869), //10%
      100: Color(0xFF0C9869), //20%
      200: Color(0xFF0C9869), //30%
      300: Color(0xFF0C9869), //40%
      400: Color(0xFF0C9869), //50%
      500: Color(0xFF0C9869), //60%
      600: Color(0xFF0C9869), //70%
      700: Color(0xFF0C9869), //80%
      800: Color(0xFF0C9869), //90%
      900: Color(0xFF0C9869), //100%
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   fontFamily: GoogleFonts.lato().fontFamily,
      //   primaryTextTheme: GoogleFonts.latoTextTheme(),
      // ),

      theme: ThemeData(
          scaffoldBackgroundColor: kbgcolor,
          // primarySwatch: Colors.lightGreen,
          primarySwatch: Palette.kToDark,
          primaryColor: kprimary,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: ktextcolor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": ((context) => const home2()),
        //"/": ((context) => const details_page()),
        "/home": ((context) => HomeScreen()),
        "/login": ((context) => const Login()),
      },
    );
  }
}
