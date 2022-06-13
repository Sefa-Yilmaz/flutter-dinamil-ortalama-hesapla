import 'package:dinamik_ortalama_hesapla/constanst/app_constant.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ortalama_hesapla_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Ortalam Hesaplam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: OrtalamHesaplaPage(),
    );
  }
}
