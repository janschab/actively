import 'package:myapp/core/firestore/model.dart';

class GlobalService {
  String userID;
  UserModel user;

  static GlobalService instance = GlobalService();

  GlobalService() {
    userID = null;
    user = null;
  }
}
