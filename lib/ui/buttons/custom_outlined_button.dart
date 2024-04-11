import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  
  final Function onPressed;
  final String text;
  final Color textColor;
  final Color color;
  final bool isFilled;
  
  
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.color = Colors.blue,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: color)
        ),
        backgroundColor: MaterialStateProperty.all(
          isFilled ? color.withOpacity(0.3) : Colors.transparent
        ),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: TextStyle( fontSize: 16, color: textColor),
        ),
      ),
    );
  }
}