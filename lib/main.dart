import 'package:first_app/pages/new-page.dart';
import 'package:first_app/pages/login-page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
      );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Draw App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Fikri Ramadhan'),
              accountEmail: new Text('fikriamadhan002@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.black54
                        : Colors.redAccent,
                child: new Text('FR',
                    style: Theme.of(context).platform == TargetPlatform.iOS ?
                    TextStyle(color: Colors.blue.withOpacity(0.9)) :
                    TextStyle(color: Colors.black.withOpacity(0.9)) ,
                    ),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: new Text('RM'),
                )
              ],
            ),
            new ListTile(
              title: new Text('Page One'),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => 
                      new NewPage('page number 1')));
              }
            ),
            new ListTile(
              title: new Text('Login'),
              trailing: new Icon(Icons.person_add),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => 
                      new LoginPage('page number 1')));
              }
            ),
            new ListTile(
              title: new Text('Close'),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Home Page"),
        ),
      ),
    );
  }
}
