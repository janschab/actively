import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/modules/dashboard/dashboard.dart';

import 'authentication_controller.dart';

class Authentication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
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
                controller: _emailField,
                decoration:
                    InputDecoration(hintText: 'email', labelText: 'Email'),
              ),
              TextFormField(
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'password', labelText: 'Password'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blue),
                child: MaterialButton(
                  onPressed: () async {
                    bool shouldNavigate =
                        await register(_emailField.text, _passwordField.text);
                    if (shouldNavigate) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ));
                    }
                  },
                  child: Text("Register"),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blue),
                child: MaterialButton(
                  onPressed: () async {
                    String shouldNavigate =
                        await signIn(_emailField.text, _passwordField.text);
                    if (shouldNavigate == "200") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ));
                    } else {
                      Fluttertoast.showToast(
                          msg: shouldNavigate,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 5
                      );
                    }
                  },
                  child: Text("Log-in"),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
