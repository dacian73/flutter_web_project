import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataBox extends StatelessWidget {
  const DataBox(
    this.ziua,
    this.luna_anul,
  );

  final String ziua;
  final String luna_anul;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 80,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
      child: Column(
        children: [
          Text(
            ziua,
            style: GoogleFonts.cinzel(
              textStyle: TextStyle(
                fontSize: 28,
                letterSpacing: 8,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 2,
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              luna_anul,
              style: GoogleFonts.cinzel(
                textStyle: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
