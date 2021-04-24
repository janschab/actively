class GlobalService {
  String userID;

  static GlobalService instance = GlobalService();

  GlobalService() {
    userID = null;
  }
}
