import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_share/Provider/user_data.dart';
import 'package:provider/provider.dart';

class ShowLinks extends StatefulWidget {
  const ShowLinks({Key? key}) : super(key: key);

  @override
  _ShowLinksState createState() => _ShowLinksState();
}

class _ShowLinksState extends State<ShowLinks> {
  final _firebaseFirestore = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'View Your Links',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _firebaseFirestore
            .doc(Provider.of<UserData>(context, listen: false).uID!)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Text(
                'Please try Again Later',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
          if (snapshot.data == null) {
            return Center(
              child: Text(
                'No Links attached with your Profile',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
          print(snapshot.data!.get("linkMap"));

          return Container(
            child: Text('This is'),
          );
        },
      ),
    );
  }
}
