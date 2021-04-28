import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/validators.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/firestore.dart';
import 'package:myapp/core/services/navigator.dart';
import 'package:myapp/core/widgets/buttons.dart';
import 'package:myapp/core/widgets/containers/full_size_container.dart';
import 'package:myapp/core/widgets/textFields.dart';

class UserDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController _firstNameField = TextEditingController();
  TextEditingController _lastNameField = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FullSizeContainer(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFormField(
              controller: _firstNameField,
              hintText: 'first name',
              labelText: 'First Name',
              validator: Validators.required,
            ),
            MyTextFormField(
              controller: _lastNameField,
              hintText: 'second name',
              labelText: 'Second Name',
              validator: Validators.required,
            ),
            MyButton(
              text: "Next",
              color: Colors.blueGrey,
              onPressed: handleUserDetails,
            ),
          ],
        ),
      ),
    );
  }

  void handleUserDetails() {
    if (Validators.validate(_formKey)) {
      FirestoreService.setUserDetails(
        _firstNameField.text,
        _lastNameField.text,
      ).then((v) {
        NavigatorService.instance.navigateTo(routeGroups);
      });
    }
  }
}
