import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String? currentUserName;
  String? currentUserEmail;
  String? userPhotoUrl;
  String? uID;
  Map<String, String>? linkMap;

  changeUserDetails(String? name, String? url, String? email, String? userID) {
    currentUserName = name;
    currentUserEmail = email;
    userPhotoUrl = url;
    uID = userID;
    notifyListeners();
  }

  addToMap(String? name, String? mediaValue) {
    if (linkMap!.containsKey(name)) {
      linkMap!.update(name!, (value) => mediaValue!);
    }
    linkMap![name!] = mediaValue!;
    notifyListeners();
  }
}
