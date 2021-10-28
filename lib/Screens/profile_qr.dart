import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_share/Provider/user_data.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserQRCode extends StatelessWidget {
  const UserQRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          'Here You Go',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: kInnerDecoration,
                  child: QrImage(
                    data: Provider.of<UserData>(context, listen: false).uID!,
                    version: QrVersions.auto,
                    size: 200.0,
                    gapless: true,
                  ),
                ),
              ),
              decoration: kGradientBoxDecoration,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Scan this QR Code with your friend and share your Profile',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(32),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient: const LinearGradient(
      colors: [Colors.pink, Colors.redAccent, Colors.cyan]),
  border: Border.all(
    color: Colors.black,
  ),
  borderRadius: BorderRadius.circular(32),
);
