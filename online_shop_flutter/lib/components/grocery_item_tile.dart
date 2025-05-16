import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryItemTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final color;

  const GroceryItemTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imageUrl, height: 84),
            Text(name, style: GoogleFonts.poppins(color: Colors.black)),
            MaterialButton(onPressed: (){},
            color: color[800],
            child: Text('\$' + price, style: GoogleFonts.poppins(color: Colors.white),),)
          ],
        ),
      ),
    );
  }
}
