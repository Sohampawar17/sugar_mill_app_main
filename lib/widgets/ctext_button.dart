import 'package:flutter/material.dart';

class CtextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color buttonColor;

  const CtextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        backgroundColor: MaterialStateProperty.all(buttonColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              // Set the overlay color for the hovered state
              return buttonColor.withOpacity(0.8);
            }
            return buttonColor; // Default overlay color
          },
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // You can uncomment the following lines if you want to add an icon
          // const Icon(
          //   Icons.upload_file,
          //   color: Colors.white,
          // ),
          // const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
