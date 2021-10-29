import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_share/Provider/user_data.dart';
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
  showEditContainer() {
    print(Provider.of<UserData>(context, listen: false).linkMap);
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
                'Media Name',
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
                child: const TextField(
                  decoration: InputDecoration(
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
                onPressed: () {},
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showEditContainer();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Image.asset(
            widget.string!,
            height: 65,
            width: 65,
          ),
        ),
      ),
    );
  }
}
