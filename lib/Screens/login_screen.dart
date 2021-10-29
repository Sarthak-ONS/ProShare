// ignore_for_file: prefer_const_literals_to_create_immutabl
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_share/Services/google_auth_api.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Text(
              'ProShare',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff0276E8),
                  ),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 35))),
              onPressed: () async {
                final user = await GoogleAuthApi().loginWithGoogle(context);
                if (user) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Image.network(
                      "https://cdn.icon-icons.com/icons2/2631/PNG/512/google_search_new_logo_icon_159150.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildRotatedWidget("reddit", 50, 50, 40),
          buildRotatedWidget("reddit", MediaQuery.of(context).size.height - 90,
              MediaQuery.of(context).size.width - 90, 40),
          buildRotatedWidget("twitter", 450, 350, 37),
          buildRotatedWidget("insta", 650, 110, 78),
          buildRotatedWidget("Linkedin", 270, 18, 12),
          buildRotatedWidget("snapchat", 170, 200, 31),
          buildRotatedWidget(
              "messenger", 55, MediaQuery.of(context).size.width - 90, 31),
          buildRotatedWidget("reddit", 50, 50, 312),
          buildRotatedWidget("facebook", MediaQuery.of(context).size.width + 75,
              MediaQuery.of(context).size.height * 0.1, 315),
        ],
      ),
    );
  }

  Widget buildRotatedWidget(
          String image, double top, double left, double tilt) =>
      Positioned(
        top: top,
        left: left,
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(tilt / 360),
          child: Image.asset(
            "Assets/Images/$image.png",
            height: 50,
            width: 50,
          ),
        ),
      );
}
