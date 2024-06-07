import 'package:flutter/material.dart';
import 'package:projectpraktpm_156_187/list_menu.dart';
import 'package:projectpraktpm_156_187/view/homepage.dart';
import 'package:projectpraktpm_156_187/base_network.dart';
import 'package:projectpraktpm_156_187/model_data/detail_drink.dart';

class DetailPage extends StatefulWidget {
  final String? idDrink;
  final String? strDrink;

  const DetailPage({Key? key, required this.idDrink, required this.strDrink}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.deepPurple[100] : Colors.deepPurple[50],
      appBar: AppBar(
        title: Text("${widget.strDrink}"),
        backgroundColor: Colors.deepOrange[300],
        actions: [
          // Tombol favorit
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            tooltip: 'Favorit',
          ),
          // Tombol home
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
            },
            icon: Icon(Icons.home),
            tooltip: 'Home',
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // FutureBuilder untuk mengambil data detail minuman
              FutureBuilder(
                future: BaseNetwork.get('lookup.php?i=${widget.idDrink}'),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return _buildErrorSection();
                  }
                  if (snapshot.hasData) {
                    final DetailDrink detail =
                    DetailDrink.fromJson(snapshot.data);
                    print(detail);
                    return _buildSuccessSection(detail);
                  }
                  return _buildLoadingSection();
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan pesan error
  Widget _buildErrorSection() {
    return Text("Error");
  }

  // Widget untuk menampilkan detail minuman saat data berhasil diambil
  Widget _buildSuccessSection(DetailDrink detail) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 10.0,
                            spreadRadius: -6.0
                        ),
                      ],
                      image: DecorationImage(
                          image: NetworkImage("${detail.drinks?[0].strDrinkThumb}"),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Text(''),
                ),
              ],
            ),
          ),
          // Widget untuk menampilkan kategori dan alkohol
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _alcohol(detail),
                SizedBox(width: 5,),
                _category(detail),
              ],
            ),
          ),
          SizedBox(height: 10,),
          _instruction(detail),
        ],
      ),
    );
  }

  // Widget untuk menampilkan indikator loading
  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  // Widget untuk tombol kategori alkohol
  Widget _alcohol(DetailDrink detail){
    return ElevatedButton(
        onPressed: (){},
        child: Text("${detail.drinks?[0].strAlcoholic}"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent[200], // Mengganti 'primary' menjadi 'backgroundColor'
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            padding: EdgeInsets.all(10)
        )
    );
  }

  // Widget untuk tombol kategori minuman
  Widget _category(DetailDrink detail){
    return ElevatedButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ListMenu(
                    kategori: detail.drinks?[0].strCategory,
                  )));
        },
        child: Text("${detail.drinks?[0].strCategory}"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple, // Mengganti 'primary' menjadi 'backgroundColor'
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            padding: EdgeInsets.all(10)
        )
    );
  }

  // Widget untuk menampilkan jenis gelas
  Widget _glass(DetailDrink detail){
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Text("${detail.drinks?[0].strGlass}")
      ),
      color: Colors.deepPurple[50],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }

  // Widget untuk menampilkan instruksi dan bahan minuman
  Widget _instruction(DetailDrink detail){
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.deepPurple,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Recipe",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                _glass(detail),
                SizedBox(height: 20,),
                const Text(
                  "Ingredients",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${detail.drinks?[0].strMeasure1} ${detail.drinks?[0].strIngredient1}",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${detail.drinks?[0].strMeasure2} ${detail.drinks?[0].strIngredient2}",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${detail.drinks?[0].strMeasure3} ${detail.drinks?[0].strIngredient3}",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${detail.drinks?[0].strMeasure4} ${detail.drinks?[0].strIngredient4}",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10,),
                const Text(
                  "Instruction",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${detail.drinks?[0].strInstructions}",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
