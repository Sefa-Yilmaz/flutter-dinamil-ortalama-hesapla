import 'package:dinamik_ortalama_hesapla/constanst/app_constant.dart';
import 'package:dinamik_ortalama_hesapla/data/data_helper.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesapla/widgets/harf_widget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/kredi_widget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamHesaplaPage extends StatefulWidget {
  OrtalamHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamHesaplaPage> createState() => _OrtalamHesaplaPageState();
}

class _OrtalamHesaplaPageState extends State<OrtalamHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHafDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStayle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: _buildForm(),
                ),
              ),
              Expanded(
                flex: 1,
                child: OrtalamGoster(
                  dersSayisi: DataHelper.tumEklenenDerler.length,
                  ortalam: DataHelper.ortalamaHesapla(),
                ),
              ),
            ],
          ),
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) {
                DataHelper.tumEklenenDerler.removeAt(index);
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPading,
            child: _buildTextFormFild(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPading,
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHafDegeri = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: Sabitler.yatayPading,
                    child: krediDropdownWidget(
                      onKrediSecildi: (kredi) {
                        secilenKrediDegeri = kredi;
                      },
                    )),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormFild() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders Adını Giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Metematik',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }

  _dersEkleveOrtalamHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHafDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.ortalamaHesapla());
      setState(() {});
    }
  }
}
