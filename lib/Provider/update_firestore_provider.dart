import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_share/Provider/user_data.dart';
import 'package:provider/provider.dart';

class UpdateProvider extends ChangeNotifier {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  Future updateDataToFireStore(context) async {
    try {
      await _firebaseFirestore
          .collection('Users')
          .doc(Provider.of<UserData>(context, listen: false).uID)
          .set({
        "linkMap": Provider.of<UserData>(context, listen: false).linkMap
      });
    } catch (e) {
      print("Error During Updating Value in Firestore");
      print(e);
    }
  }
}
