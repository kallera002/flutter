import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  final String title;
  final _key = new GlobalKey<FormState>();
  String username;
  String password;
  LoginPage(this.title);

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      print("$username, $password");
    }
  }

  login() async {
    final response = await http.post('http://192.168.43.162/login', body:{
          'email' : username, 
          'password' : password
        });
    // final data = jsonDecode(response.body);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: new Container(
        child: new Center(
          child: Form(
            key: _key,
            child: new ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  validator: (e){
                    if (e.isEmpty) {
                      return "please insert username";
                    }
                  },
                  onSaved: (e) => username = e,
                  decoration: InputDecoration(labelText: "username"),
                ),
                TextFormField(
                  obscureText: true,
                  onSaved: (e) => password = e,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                MaterialButton(
                  onPressed: () {
                    check();
                  },
                  child: new Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
