import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_share/Provider/user_data.dart';
import 'package:pro_share/Screens/login_screen.dart';
import 'package:pro_share/Screens/scan_qr_screen.dart';
import 'package:pro_share/Screens/show_link.dart';
import 'package:pro_share/Services/google_auth_api.dart';
import 'package:pro_share/Widgets/icon_container.dart';
import 'package:pro_share/Screens/profile_qr.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildSpacer({double? val = 15}) {
    return SizedBox(
      height: val,
    );
  }

  showQRCode(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const UserQRCode()));
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Provider.of<UserData>(context, listen: false).changeUserDetails(
      _firebaseAuth.currentUser!.displayName,
      _firebaseAuth.currentUser!.photoURL,
      _firebaseAuth.currentUser!.email,
      _firebaseAuth.currentUser!.uid,
    );
    Provider.of<UserData>(context, listen: false).addLinksToFirestore(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'ProShare',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          'Scan QR Code',
                          style: GoogleFonts.poppins(),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ScanOtherUserQR(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Text(
                          'View Your Profile Links',
                          style: GoogleFonts.poppins(),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ShowLinks(),
                            ),
                          );
                        },
                      ),
                      //ShowLinks
                      ListTile(
                        title: Text(
                          'Logout',
                          style: GoogleFonts.poppins(),
                        ),
                        onTap: () {
                          GoogleAuthApi().logout();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.menu_open,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 42,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 40,
                foregroundImage: NetworkImage(
                  Provider.of<UserData>(context).userPhotoUrl!,
                ),
              ),
            ),
            buildSpacer(val: 20),
            Text(
              Provider.of<UserData>(context).currentUserName!,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            buildSpacer(),
            Text(
              Provider.of<UserData>(context).currentUserEmail!,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w200,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            buildSpacer(val: 6),
            const Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.white54,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'Share Your QR Code',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: const Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
              onTap: () {
                showQRCode(context);
              },
            ),
            buildSpacer(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff120E43),
                    borderRadius: BorderRadius.circular(15.0)),
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(2.0),
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const IconContainer(
                      string: "Assets/Images/tumb.png",
                      socialMediaName: 'Tumbler',
                    ),
                    const IconContainer(
                      string: "Assets/Images/reddit.png",
                      socialMediaName: 'Reddit',
                    ),
                    const IconContainer(
                      string: "Assets/Images/facebook.png",
                      socialMediaName: 'Facebook',
                    ),
                    const IconContainer(
                      string: "Assets/Images/twitter.png",
                      socialMediaName: 'Twitter',
                    ),
                    const IconContainer(
                      string: "Assets/Images/github.png",
                      socialMediaName: 'Github',
                    ),
                    const IconContainer(
                      string: "Assets/Images/insta.png",
                      socialMediaName: 'Instagram',
                    ),
                    const IconContainer(
                      string: "Assets/Images/messenger.png",
                      socialMediaName: 'Messenger',
                    ),
                    const IconContainer(
                      string: "Assets/Images/snapchat.png",
                      socialMediaName: 'Snapchat',
                    ),
                    const IconContainer(
                      string: "Assets/Images/Linkedin.png",
                      socialMediaName: 'Linkedin',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
