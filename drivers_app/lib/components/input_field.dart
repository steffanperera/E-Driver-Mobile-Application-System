import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  const InputField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        // onChanged: onChanged,
        cursorColor: const Color(0xFF3EA2F9),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFB0B0B0),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
