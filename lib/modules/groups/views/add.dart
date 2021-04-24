import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:myapp/core/helpers/validators.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/navigator.dart';
import 'package:myapp/core/widgets/buttons.dart';
import 'package:myapp/core/widgets/textFields.dart';
import 'package:myapp/modules/groups/services/service.dart';

class AddGroup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new group"),
      ),
      body: LoadingOverlay(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                constraints: BoxConstraints(maxWidth: 500),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextFormField(
                          controller: _name,
                          labelText: "Name",
                          hintText: "name",
                          validator: Validators.required
                      ),
                      MyButton(
                        onPressed: addGroup,
                        text: "Add group",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        isLoading: _loading,
      )
    );
  }

  void addGroup() {
    if (Validators.validate(_formKey)) {
      setState(() {
        _loading = true;
      });
      GroupsService.addGroup(name: _name.text).then((value) {
        _loading = false;
        NavigatorService.instance.navigateTo(routeGroups);
      });
    }
  }
}
