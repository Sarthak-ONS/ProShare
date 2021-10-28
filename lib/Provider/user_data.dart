import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String? currentUserName;
  String? currentUserEmail;
  String? userPhotoUrl;
  String? uID;

  changeUserDetails(String? name, String? url, String? email, String? userID) {
    currentUserName = name;
    currentUserEmail = email;
    userPhotoUrl = url;
    uID = userID;
    notifyListeners();
  }
}
