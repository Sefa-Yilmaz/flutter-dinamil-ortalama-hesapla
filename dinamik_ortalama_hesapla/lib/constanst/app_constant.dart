import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;
  static const String baslikText = 'Ortalama Hesapla';
  static final TextStyle baslikStayle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );
  static BorderRadius borderRadius = BorderRadius.circular(16);
  static final TextStyle ortalamGosterStayle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: anaRenk,
  );
  static final TextStyle ortalamaStayle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: anaRenk,
  );
  static final EdgeInsets dropDownPading =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final EdgeInsets yatayPading = EdgeInsets.symmetric(horizontal: 8);
}
