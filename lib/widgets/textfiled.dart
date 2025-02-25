import 'package:flutter/material.dart';

class TextFiledWidget extends StatefulWidget {
  final String labelText;
  final Widget? suffix;
  final bool obscureText;
  final Color backgroundColor;
  final Color? textcolor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextFiledWidget({
    required this.obscureText,
    required this.labelText,
    this.controller,
    this.textcolor,
    this.suffix,
    this.validator,
    this.backgroundColor = Colors.white,
    super.key,
  });

  @override
  State<TextFiledWidget> createState() => _TextFiledWidgetState();
}

class _TextFiledWidgetState extends State<TextFiledWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.labelText,
          hintStyle: TextStyle(
            fontSize: 15,
            color: widget.textcolor ?? Colors.black,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: widget.backgroundColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 228, 12, 12),
              width: 1.5,
            ),
          ),
          suffixIcon: widget.suffix,
        ),
        obscureText: widget.obscureText,
      ),
    );
  }
}
