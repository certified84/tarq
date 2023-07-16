import 'package:flutter/material.dart';

Widget textField(
    {required double width,
    TextInputType? keyboardType,
    String? hintText,
    void Function()? onPressed}) {
  return SizedBox(
    width: width,
    child: TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: const Color(0xFFF9FAFB),
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFF9FAFB),
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF3734A9),
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        hintText: hintText,
      ),
    ),
  );
}

Widget passwordTextField(
    {required double width,
    String? hintText,
    required bool showPassword,
    void Function()? onPressed}) {
  return SizedBox(
    width: width,
    child: TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: !showPassword,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        fillColor: const Color(0xFFF9FAFB),
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFF9FAFB),
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF3734A9),
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        hintText: hintText,
        suffixIcon: IconButton(
          icon: showPassword
              ? const Icon(
                  Icons.remove_red_eye,
                  size: 24,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.remove_red_eye,
                  size: 24,
                  color: Colors.black,
                ),
          tooltip: 'Hide/Show password',
          onPressed: onPressed,
        ),
      ),
    ),
  );
}
