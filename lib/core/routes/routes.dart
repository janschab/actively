import 'package:flutter/material.dart';
import 'package:myapp/modules/activities/activities.dart';
import 'package:myapp/modules/authentication/authentication.dart';
import 'package:myapp/modules/authentication/user_resolver.dart';
import 'package:myapp/modules/groups/views/add.dart';
import 'package:myapp/modules/groups/views/groups.dart';
import 'package:myapp/modules/profile/profile.dart';
import 'package:myapp/modules/tags/tags.dart';

const routeEmpty = '';
const routeAdd = '/add';

const routeHome = '/';
const routeLogin = '/login';
const routeGroups = '/groups';
const routeGroupsAdd = "$routeGroups$routeAdd";
const routeActivities = '/activities';
const routeTags = '/tags';
const routeProfile = '/profile';

getRoutes() {
  return {
    routeHome: (context) => UserResolver(),
    routeLogin: (context) => Authentication(),
    routeGroups: (context) => Groups(),
    routeGroupsAdd: (context) => AddGroup(),
    routeActivities: (context) => Activities(),
    routeProfile: (context) => Profile(),
    routeTags: (context) => Tags(),
  };
}

MaterialPageRoute handleGenerateRoute(settings) {
  Widget page;
  if (settings.name == routeHome) {
    page = UserResolver();
  } else if (settings.name == routeProfile) {
    page = Profile();
  } else if (settings.name.startsWith(routeGroups)) {
    final subRoute = settings.name.substring(
      routeGroups.length,
    );
    page = SetupFlow(
      initialSetupRoute: subRoute,
    );
  } else {
    throw Exception('Unknown route: ${settings.name}');
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}

class SetupFlow extends StatefulWidget {
  const SetupFlow({
    Key key,
    this.setupPageRoute, initialSetupRoute,
  }) : super(key: key);

  final String setupPageRoute;

  @override
  SetupFlowState createState() => SetupFlowState();
}

class SetupFlowState extends State<SetupFlow> {
  @override
  Widget build(BuildContext context) {
    return Text("tetes");
  }
}

