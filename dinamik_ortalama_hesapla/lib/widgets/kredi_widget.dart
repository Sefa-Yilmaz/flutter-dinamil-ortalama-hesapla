import 'package:flutter/material.dart';

import '../constanst/app_constant.dart';
import '../data/data_helper.dart';

class krediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  krediDropdownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  State<krediDropdownWidget> createState() => _krediDropdownWidgetState();
}

class _krediDropdownWidgetState extends State<krediDropdownWidget> {
  double secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPading,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            widget.onKrediSecildi(deger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}
