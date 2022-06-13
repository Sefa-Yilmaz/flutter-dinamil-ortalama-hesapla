import 'package:dinamik_ortalama_hesapla/constanst/app_constant.dart';
import 'package:flutter/material.dart';

class OrtalamGoster extends StatelessWidget {
  final double ortalam;
  final int dersSayisi;
  const OrtalamGoster(
      {required this.dersSayisi, required this.ortalam, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Giriniz' : 'Ders Seciniz',
          style: Sabitler.ortalamGosterStayle,
        ),
        Text(
          ortalam >= 0 ? '${ortalam.toStringAsFixed(2)}' : '0.0',
          style: Sabitler.ortalamaStayle,
        ),
        Text(
          'ortalam',
          style: Sabitler.ortalamGosterStayle,
        ),
      ],
    );
  }
}
