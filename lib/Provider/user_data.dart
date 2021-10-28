import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String? currentUserName;
  String? currentUserEmail;
  String? userPhotoUrl;

  changeUserDetails(String? name, String? url, String? email) {
    currentUserName = name;
    currentUserEmail = email;
    userPhotoUrl = url;
    notifyListeners();
  }
}
