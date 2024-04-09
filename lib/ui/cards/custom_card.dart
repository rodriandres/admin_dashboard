import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {

  final String? title;
  final Widget child;
  final Color color;
  final double? width;


  const CustomCard({
    super.key,
    this.title,
    required this.child,
    this.color = Colors.white,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width : null,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[

          if(title != null) 
          ...[
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title!,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              const Divider(),
            ],
          
          child

          // Card(
          //   child: child,
          // ),
        ]
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => 
    BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5),
      boxShadow:[ 
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 5
        ),
      ]
    );
}