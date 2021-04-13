import 'package:myapp/core/authentication/authentication.dart';
import 'package:myapp/core/authentication/user_resolver.dart';
import 'package:myapp/modules/activities/activities.dart';
import 'package:myapp/modules/groups/groups.dart';

getRoutes() {
  return {
    '/': (context) => UserResolver(),
    '/login': (context) => Authentication(),
    '/groups': (context) => Groups(),
    '/activities': (context) => Activities(),
  };
}