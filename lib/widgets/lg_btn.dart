// widgets/lg_btn.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LGBtn extends StatefulWidget {
  final String text;
  final Widget targetPage; // Add a target page as a parameter

  const LGBtn(
      {super.key,
      required this.text,
      required this.targetPage}); // Add targetPage to constructor

  @override
  State<LGBtn> createState() => _LGBtnState();
}

class _LGBtnState extends State<LGBtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Use Navigator to navigate to the targetPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                widget.targetPage, // Navigate to the provided page
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
