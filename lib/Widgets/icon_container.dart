import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({Key? key, this.string}) : super(key: key);

  final String? string;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Opening Sheet");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Image.asset(
            string!,
            height: 65,
            width: 65,
          ),
        ),
      ),
    );
  }
}
