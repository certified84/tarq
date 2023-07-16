import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget actionButton(
    {required width, required text, void Function()? onPressed}) {
  return SizedBox(
    width: width,
    height: 50,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF3734A9)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget googleButton(
    {required width, required text, void Function()? onPressed}) {
  return SizedBox(
    width: width,
    height: 50,
    child: OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFF8692A6),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: SvgPicture.asset(
        'assets/svgs/google.svg',
        semanticsLabel: 'Google Icon',
      ),
    ),
  );
}

Widget appleButton(
    {required width, required text, void Function()? onPressed}) {
  return SizedBox(
    width: width,
    height: 50,
    child: OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFF8692A6),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: SvgPicture.asset(
        'assets/svgs/apple.svg',
        semanticsLabel: 'Google Icon',
      ),
    ),
  );
}
