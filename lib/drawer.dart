import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://upload.wikimedia.org/wikipedia/commons/a/a8/Bill_Gates_2017_%28cropped%29.jpg";
    return Drawer(
      child: Container(
          color: Colors.blueAccent,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  accountName: Text("Yaseen"),
                  accountEmail: Text("yaseen@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Home',
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  )),
              ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Profile',
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  )),
              ListTile(
                  leading: Icon(
                    CupertinoIcons.mail,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Email',
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          )),
    );
  }
}
