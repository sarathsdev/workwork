import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'apply.dart';
import 'sections.dart';
import 'settings.dart';

class Home extends StatelessWidget {
  Home({this.uid});
  final String uid;
  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Center(child:Text("WORKWORK"),
          ),
        ),
        body:new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Welocome to WORKWORK Platform',
              ),

            ],
          ),
        ), 

        drawer: NavigateDrawer(uid: this.uid),
    );
  }
}

class NavigateDrawer extends StatefulWidget {
  final String uid;
  NavigateDrawer({Key key, this.uid}) : super(key: key);
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
      DrawerHeader(
      margin: EdgeInsets.zero,
          padding: EdgeInsets.zero, 
          child: Stack(children: <Widget>[
            Positioned(
                bottom: 72.0,
                left: 96.0,
                child: Text("WORKWORK",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),),),
          ])),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.pink),
              onPressed: () => null,
            ),
            title: Text('Home',
              style: TextStyle(color: Colors.pink),),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid: widget.uid)),
              );
            },
          ),

          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.touch_app, color: Colors.pink),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Apply()),
                );
              }
            ),
            title: Text('Apply',
              style: TextStyle(color: Colors.pink),
            ),
            onTap: () {

              print(widget.uid);
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.find_in_page, color: Colors.pink),
              onPressed: () => null,
            ),
            title: Text('Sections',
              style: TextStyle(color: Colors.pink),
            ),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sections()),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.settings, color: Colors.pink),
              onPressed: () => null,
            ),
            title: Text('Settings',
              style: TextStyle(color: Colors.pink),
            ),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.exit_to_app, color: Colors.pink),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                });
              },
            ),
            title: Text('Sign out',
              style: TextStyle(color: Colors.pink),
            ),
            onTap: () {
              print(widget.uid);
            },
          ),
        ],
      ),
    );
  }
}


