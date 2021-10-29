import 'package:flutter/cupertino.dart';
import 'package:pro_share/Provider/update_firestore_provider.dart';
import 'package:provider/provider.dart';

class UserData extends ChangeNotifier {
  String? currentUserName;
  String? currentUserEmail;
  String? userPhotoUrl;
  String? uID;
  Map<String, String> linkMap = {
    "Github": "",
    "Tumbler": "",
    "reddit": "",
    "Facebook": "",
    "Instagram": "",
    "Messenger": "",
    "Snapchat": "",
    "Linkedin": "",
    "Twitter": ""
  };

  changeUserDetails(String? name, String? url, String? email, String? userID) {
    currentUserName = name;
    currentUserEmail = email;
    userPhotoUrl = url;
    uID = userID;
    notifyListeners();
  }

  addToMap(String socialMediaName, String socialMediaLink, context) {
    linkMap[socialMediaName] = socialMediaLink;
    print("Updated Value in Map Succeddfully");
    print(linkMap);
    notifyListeners();
  }
}
