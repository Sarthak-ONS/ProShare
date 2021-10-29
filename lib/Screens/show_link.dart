import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_share/Provider/user_data.dart';
import 'package:provider/provider.dart';

class ShowLinks extends StatefulWidget {
  const ShowLinks({Key? key, @required this.userID}) : super(key: key);

  final String? userID;

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
        future: _firebaseFirestore.doc(widget.userID).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error Fetchig Data'),
            );
          }
          Map linkMap = snapshot.data!.get("linkMap");
          return ListView(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  foregroundImage: AssetImage("Assets/Images/Linkedin.png"),
                ),
                title: Text(
                  linkMap['Linkedin'] == ""
                      ? "No Link added"
                      : linkMap['Linkedin'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const CircleAvatar(
                  foregroundImage: AssetImage("Assets/Images/facebook.png"),
                ),
                title: Text(
                  linkMap['Facebook'] == ""
                      ? "No Link added"
                      : linkMap['Facebook'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundImage: AssetImage("Assets/Images/github.png"),
                ),
                title: Text(
                  linkMap['Github'] == "" ? "No Link added" : linkMap['Github'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const CircleAvatar(
                  foregroundImage: AssetImage("Assets/Images/reddit.png"),
                ),
                title: Text(
                  linkMap['reddit'] == "" ? "No Link added" : linkMap['reddit'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundImage: AssetImage(
                    "Assets/Images/insta.png",
                  ),
                ),
                title: Text(
                  linkMap['Instagram'] == ""
                      ? "No Link added"
                      : linkMap['Instagram'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const CircleAvatar(
                  foregroundImage: AssetImage("Assets/Images/tumb.png"),
                ),
                title: Text(
                  linkMap['Tumbler'] == ""
                      ? "No Link added"
                      : linkMap['Tumbler'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const CircleAvatar(
                  foregroundImage: AssetImage("Assets/Images/snapchat.png"),
                ),
                title: Text(
                  linkMap['Snapchat'] == ""
                      ? "No Link added"
                      : linkMap['Snapchat'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const CircleAvatar(
                  foregroundImage: AssetImage("Assets/Images/messenger.png"),
                ),
                title: Text(
                  linkMap['Messenger'] == ""
                      ? "No Link added"
                      : linkMap['Messenger'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const CircleAvatar(
                  foregroundImage: AssetImage("Assets/Images/twitter.png"),
                ),
                title: Text(
                  linkMap['Twitter'] == ""
                      ? "No Link added"
                      : linkMap['Twitter'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
