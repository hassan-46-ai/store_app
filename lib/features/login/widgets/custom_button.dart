import 'package:flutter/material.dart';
class CustomElevatedBTN extends StatelessWidget {

  CustomElevatedBTN({

    super.key,
    required this.onPressed,
    required this.text

  });
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),

        onPressed:onPressed,
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
