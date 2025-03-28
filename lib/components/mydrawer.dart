import 'package:animationtest/setting.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(Icons.music_note,color: Colors.blueAccent,size: 60,)),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text('favorite'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text('favorite'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Parametre'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(toggletheme: (bool value) {  }, isDark: false,)));
              },
            ),
          ),
        ],
      ),
    );
  }
}