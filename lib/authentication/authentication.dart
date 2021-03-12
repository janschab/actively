import 'package:flutter/material.dart';
import 'package:myapp/authentication/authentication_controller.dart';
import 'package:myapp/main.dart';

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
                            builder: (context) => MyHomePage(),
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
                    bool shouldNavigate =
                        await signIn(_emailField.text, _passwordField.text);
                    if (shouldNavigate) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ));
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
