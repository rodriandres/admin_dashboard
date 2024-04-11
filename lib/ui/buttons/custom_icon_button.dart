import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color color;
  final bool isFilled;
  final Function onPressed;

  const CustomIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.color = Colors.blue,
    this.isFilled = false,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
        backgroundColor: MaterialStateProperty.all( color.withOpacity(0.5) ),
        overlayColor: MaterialStateProperty.all( color.withOpacity(0.5) ),
      ), 
      onPressed: () => onPressed(),
      child: Row(
        children: [        
          Icon( icon ),
          Text(text, style: const TextStyle( fontSize: 16, color: Colors.white ),),       
        ],
      ),
    );
  }
}