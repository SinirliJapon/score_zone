import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:score_zone/utils/functions.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String title = 'Welcome to Score Zone';
    String details =
        'Access the data of the popular leagues and cups in the world.\nSome data can be outdated or incomplete because of the free plan.\n';
    return GestureDetector(
      onTap: () => Functions.showPopup(context, title, details),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', fit: BoxFit.cover, width: 100),
          const SizedBox(width: 10),
          Text('SCORE', style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 40)),
          Text('ZONE', style: GoogleFonts.inter(fontWeight: FontWeight.w900, fontSize: 40)),
        ],
      ),
    );
  }
}
