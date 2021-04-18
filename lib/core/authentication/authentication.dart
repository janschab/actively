import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/navigator.dart';
import 'package:myapp/core/widgets/buttons.dart';
import 'package:myapp/core/widgets/textFields.dart';

import 'service.dart';

class Authentication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _displayNameField = TextEditingController();
  TextEditingController _emailField =
      TextEditingController(text: "test@test.pl");
  TextEditingController _passwordField = TextEditingController(text: "test123");

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
              MyTextFormField(
                controller: _displayNameField,
                hintText: 'display name',
                labelText: 'Display name',
                onFieldSubmitted: (s) => handleLogInAction,
              ),
              MyTextFormField(
                controller: _emailField,
                hintText: 'email',
                labelText: 'Email',
                onFieldSubmitted: (s) => handleLogInAction,
              ),
              MyTextFormField(
                controller: _passwordField,
                obscureText: true,
                hintText: 'password',
                labelText: 'Password',
                onFieldSubmitted: (s) => handleLogInAction,
              ),
              MyButton(
                text: "Log-in",
                color: Colors.blueGrey,
                onPressed: handleLogInAction,
              ),
              MyButton(
                text: "Register",
                color: Colors.blueGrey,
                onPressed: handleRegisterAction,
              ),
            ],
          ),
        ),
      )),
    );
  }

  handleLogInAction() async {
    String signInStatus = await AuthenticationService.signIn(
      _emailField.text,
      _passwordField.text,
    );
    if (signInStatus == "200") {
      NavigatorService.instance.navigateTo(routeGroups);
    } else {
      Fluttertoast.showToast(
          msg: signInStatus,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5);
    }
  }

  handleRegisterAction() async {
    String registerStatus = await AuthenticationService.register(
      _emailField.text,
      _passwordField.text,
      _displayNameField.text,
    );
    if (registerStatus == "200") {
      NavigatorService.instance.navigateTo(routeGroups);
    } else {
      Fluttertoast.showToast(
          msg: registerStatus,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5);
    }
  }
}
