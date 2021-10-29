import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pro_share/Provider/user_data.dart';
import 'package:provider/provider.dart';

class FirebaseFireStoreAPI {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  Future updateLink(context) async {
    try {
      await _firebaseFirestore
          .collection('Users')
          .doc(Provider.of<UserData>(context, listen: false).uID)
          .set({
        "linkMap": Provider.of<UserData>(context, listen: false).linkMap
      });
    } catch (e) {
      print("Error updating Document in Firestore");
      print(e);
    }
  }
}
