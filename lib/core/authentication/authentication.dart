import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/modules/groups/groups.dart';

import 'authentication_controller.dart';

class Authentication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _displayNameField = TextEditingController();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              TextFormField(
                controller: _displayNameField,
                decoration: InputDecoration(
                  hintText: 'display name',
                  labelText: 'Display name',
                ),
                onFieldSubmitted: handleLogInAction,
              ),
              TextFormField(
                controller: _emailField,
                decoration: InputDecoration(
                  hintText: 'email',
                  labelText: 'Email',
                ),
                onFieldSubmitted: handleLogInAction,
              ),
              TextFormField(
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password',
                  labelText: 'Password',
                ),
                onFieldSubmitted: handleLogInAction,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.deepOrange),
                child: MaterialButton(
                  onPressed: () {
                    handleLogInAction('');
                  },
                  child: Text("Log-in"),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.transparent,
                  border: Border.all(width: 1.0, color: Colors.deepOrange),
                ),
                child: MaterialButton(
                  onPressed: handleRegisterAction,
                  child: Text("Register"),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  handleLogInAction(str) async {
    String signInStatus = await signIn(_emailField.text, _passwordField.text);
    if (signInStatus == "200") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Groups(),
          ));
    } else {
      Fluttertoast.showToast(
          msg: signInStatus,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5);
    }
  }

  handleRegisterAction() async {
    String registerStatus = await register(_emailField.text, _passwordField.text, _displayNameField.text);
    if (registerStatus == "200") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Groups(),
          ));
    } else {
      Fluttertoast.showToast(
          msg: registerStatus,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5);
    }
  }
}
