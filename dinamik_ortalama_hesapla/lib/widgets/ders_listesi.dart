import 'package:dinamik_ortalama_hesapla/constanst/app_constant.dart';
import 'package:dinamik_ortalama_hesapla/data/data_helper.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDesler = DataHelper.tumEklenenDerler;
    return tumDesler.length > 0
        ? ListView.builder(
            itemCount: tumDesler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDesler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumDesler[index].harfDegeri *
                                tumDesler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          '${tumDesler[index].krediDegeri} kredi, not degeri ${tumDesler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                'lütfen ders ekleyin',
                style: Sabitler.baslikStayle,
              ),
            ),
          );
  }
}