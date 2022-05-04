import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathikk/widgets/login.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Icon> iconx = [
      Icon(CupertinoIcons.home),
      Icon(CupertinoIcons.profile_circled),
      Icon(CupertinoIcons.mail)
    ];
    const imageurl =
        "https://nick-intl.mtvnimages.com/uri/mgid:file:http:shared:media.mtvi.com/_!/intlod/MTVInternational/nick.co.uk/2020/08/12/1597222659686/6181eda980715f28a475951e86e6c0a7_1440x1080_1.jpg?quality=0.75&height=360&width=480&matte=true&crop=true";

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountEmail: Text('vikram@gmail.com'),
              accountName: Text('Vikram'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
              ),
            ),
          ),
          ListTile(leading: Icon(CupertinoIcons.home), title: Text('home')),
          InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login())),
            child: ListTile(
                leading: Icon(CupertinoIcons.profile_circled),
                title: Text('Login')),
          ),
          ListTile(
              leading: Icon(CupertinoIcons.settings), title: Text('settings '))
        ],
      ),
    );
  }
}
