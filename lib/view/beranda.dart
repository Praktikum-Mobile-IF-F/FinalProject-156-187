import 'package:flutter/material.dart';
import 'package:projectpraktpm_156_187/helper/shared_preference.dart';
import 'package:projectpraktpm_156_187/list_menu.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final List<String> Category = [
    "Ordinary Drink",
    "Cocktail",
    "Shake",
    "Cocoa",
    "Shot",
    "Beer",
    "Soft Drink",
    "Coffee / Tea",
    "Punch/Party Drink"
  ];
  final List<String> kategori = [
    "Ordinary_Drink",
    "Cocktail",
    "Shake",
    "Cocoa",
    "Shot",
    "Beer",
    "Soft_Drink",
    "Coffee_/_Tea",
    "Punch/Party_Drink"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Center(
          child: FutureBuilder(
            future: SharedPreference().getUsername(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return Text(
                "Hai, ${snapshot.data}",
                style: TextStyle(fontSize: 24),
              );
            },
          ),
        ),
        backgroundColor: Colors.deepOrange[300],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
          child: Column(
            children: [
              Text(
                "What are you looking for?",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: kategori.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.deepPurple[200],
                    elevation: 10,
                    shadowColor: Colors.deepPurple,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListMenu(kategori: kategori[index]),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            Category[index],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
