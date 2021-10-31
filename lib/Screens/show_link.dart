import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowLinks extends StatefulWidget {
  const ShowLinks({Key? key, @required this.userID}) : super(key: key);

  final String? userID;

  @override
  _ShowLinksState createState() => _ShowLinksState();
}

class _ShowLinksState extends State<ShowLinks> {
  final _firebaseFirestore = FirebaseFirestore.instance.collection('Users');

  copytoClipBoard(String text) {
    print(text);
    if (text.isNotEmpty) {
      FlutterClipboard.copy(text).then((value) {});
      Fluttertoast.showToast(
          msg: "Link Copied",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    Fluttertoast.showToast(
        msg: "No Link is Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          'View Your Links',
          style: GoogleFonts.poppins(color: Colors.white),
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
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                tileColor: const Color(0xff2D2D35),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/Linkedin.png"),
                    ),
                  ),
                ),
                title: Text(
                  linkMap['Linkedin'] == ""
                      ? "No Link added"
                      : linkMap['Linkedin'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Linkedin']);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/facebook.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Facebook']);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Facebook'] == ""
                      ? "No Link added"
                      : linkMap['Facebook'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/github.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Github']);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Github'] == "" ? "No Link added" : linkMap['Github'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/reddit.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['reddit']);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['reddit'] == "" ? "No Link added" : linkMap['reddit'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage("Assets/Images/insta.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Instagram']);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Instagram'] == ""
                      ? "No Link added"
                      : linkMap['Instagram'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/tumb.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Tumbler']);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Tumbler'] == ""
                      ? "No Link added"
                      : linkMap['Tumbler'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/snapchat.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Snapchat']);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Snapchat'] == ""
                      ? "No Link added"
                      : linkMap['Snapchat'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage:
                          AssetImage("Assets/Images/messenger.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Messenger']);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Messenger'] == ""
                      ? "No Link added"
                      : linkMap['Messenger'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/twitter.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Twitter']);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Twitter'] == ""
                      ? "No Link added"
                      : linkMap['Twitter'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
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
