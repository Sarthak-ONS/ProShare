import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_share/Provider/user_data.dart';
import 'package:pro_share/Services/firebase_firestore_api.dart';
import 'package:provider/provider.dart';

class IconContainer extends StatefulWidget {
  const IconContainer({Key? key, this.string, this.socialMediaName})
      : super(key: key);

  final String? string;
  final String? socialMediaName;

  @override
  State<IconContainer> createState() => _IconContainerState();
}

class _IconContainerState extends State<IconContainer> {
  showSnackBar(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(message),
      ),
    );
  }

  TextEditingController textEditingController = TextEditingController();
  showEditContainer(String? mediaValue) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '$mediaValue',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Make Sure to add correct link to every Card.',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.lightBlueAccent)),
                      labelText: "Enter Your Link",
                      hintText: "www.example.com"),
                  // controller: controller,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 12.0)),
                  elevation: MaterialStateProperty.resolveWith<double?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) return 16;
                      return null;
                    },
                  ),
                ),
                onPressed: () {
                  try {
                    print("Callling this mEthod ON PRESSED");
                    Provider.of<UserData>(context, listen: false).addToMap(
                        mediaValue!, textEditingController.value.text, context);
                    Navigator.pop(context);
                    FirebaseFireStoreAPI().updateLink(context);
                    showSnackBar(context, "Successfully Updated Your Links");
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showEditContainer(widget.socialMediaName);
        print(widget.socialMediaName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Image.asset(
            widget.string!,
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}
