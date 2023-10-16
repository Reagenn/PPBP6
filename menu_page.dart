import 'package:flutter/material.dart';
import 'menu.dart';
import 'pesan_page.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  List<Menu> listMenu = [];

  void dummyMenu() {
    listMenu.add(Menu(
        nama: 'Sate Ayam',
        deskripsi: "Sate yang dibuat dari Ayam",
        harga: 20000,
        gambar: 'Sate.jpg'));
    listMenu.add(Menu(
        nama: "Soto Ayam",
        deskripsi: "Soto ayam gurih kuah kental kentul",
        harga: 15000,
        gambar: 'Soto-Ayam-Kuning.jpg'));
    listMenu.add(Menu(
        nama: "Bubur Ayam",
        deskripsi: "Bubur Ayam Jakarta",
        harga: 18000,
        gambar: 'Bubur-Ayam.jpg'));
    listMenu.add(Menu(
        nama: "Steak",
        deskripsi: "Steak ala Waroeng",
        harga: 25000,
        gambar: 'Steak-enak.jpg'));
    listMenu.add(Menu(
        nama: "Es Teh Ajib",
        deskripsi: "Es Teh Ajib segar menyegarkan #estehajib",
        harga: 3000,
        gambar: 'Estehajib-Jumbo.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    dummyMenu();
    return Scaffold(
      appBar: AppBar(title: Text('Aplikasi Menu Makanan')),
      body: Column(children: [
        const SizedBox(
          width: double.infinity,
          child: Text(
            "===============================\nPilih Menu\n===============================",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, // Membuat teks tebal
            ),
            textAlign: TextAlign.center, // Posisikan teks di tengah
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listMenu.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Container(
                  width: 80,
                  height: 80,
                  child: Image.asset('assets/images/${listMenu[index].gambar}'),
                ),
                title:
                    Text(listMenu[index].nama, style: TextStyle(fontSize: 18)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listMenu[index].deskripsi),
                    Text("Rp. ${listMenu[index].harga}",
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
                trailing: ElevatedButton(
                  child: Text("Pesan"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PesanPage(pesananMenu: listMenu[index]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
