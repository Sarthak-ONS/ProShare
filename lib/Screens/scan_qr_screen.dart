import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanOtherUserQR extends StatefulWidget {
  const ScanOtherUserQR({Key? key}) : super(key: key);

  @override
  State<ScanOtherUserQR> createState() => _ScanOtherUserQRState();
}

class _ScanOtherUserQRState extends State<ScanOtherUserQR> {
  final qrkey = GlobalKey(debugLabel: 'QRSCANNER');

  QRViewController? controller;

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  Barcode? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Scan QR Code',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(children: [
        buildQRScanner(),
        Positioned(
          bottom: 15,
          left: 20,
          child: buildQrValue(),
        ),
      ]),
    );
  }

  Widget buildQrValue() => Container(
        color: Colors.black,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Scan the Code',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
      );

  Widget buildQRScanner() => QRView(
        key: qrkey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderColor: Colors.lightBlueAccent,
          borderRadius: 10,
          borderWidth: 5,
          borderLength: 20,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print(scanData.code);
      setState(() {
        data = scanData;
      });
    });
  }
}
