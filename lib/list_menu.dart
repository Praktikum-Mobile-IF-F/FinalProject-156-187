import 'package:flutter/foundation.dart';
import 'package:projectpraktpm_156_187/base_network.dart';
import 'package:projectpraktpm_156_187/model_data/category_drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectpraktpm_156_187/view/homepage.dart';
import 'package:projectpraktpm_156_187/detail_page.dart';

class ListMenu extends StatefulWidget {
  final String? kategori;
  const ListMenu({Key? key, required this.kategori}) : super(key: key);
  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  List<Drinks> _drinks = [];
  List<Drinks> _filteredDrinks = [];
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _fetchDrinks();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredDrinks = _drinks
          .where((drink) =>
          drink.strDrink!.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  Future<void> _fetchDrinks() async {
    final data = await BaseNetwork.get('filter.php?c=${widget.kategori}');
    CategoryDrink categoryDrink = CategoryDrink.fromJson(data);
    setState(() {
      _drinks = categoryDrink.drinks!;
      _filteredDrinks = _drinks;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white54),
          ),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          cursorColor: Colors.white,
        )
            : Text("${widget.kategori}"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[300],
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.clear : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _filteredDrinks = _drinks;
                  _searchController.clear();
                }
              });
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
              );
            },
            icon: Icon(Icons.home),
            tooltip: 'Home',
          ),
        ],
      ),
      body: _buildDetailDessertBody(),
    );
  }

  Widget _buildDetailDessertBody() {
    if (_drinks.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return _buildSuccessSection();
    }
  }

  Widget _buildSuccessSection() {
    return GridView.builder(
      itemCount: _filteredDrinks.length,
      itemBuilder: (BuildContext context, int index) {
        final Drinks drinks = _filteredDrinks[index];
        return Card(
          color: Colors.deepPurple[50],
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    idDrink: drinks.idDrink,
                    strDrink: drinks.strDrink,
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0.0, 5.0),
                        blurRadius: 10.0,
                        spreadRadius: -6.0,
                      ),
                    ],
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.multiply),
                      image: NetworkImage("${drinks.strDrinkThumb}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: 120,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${drinks.strDrink}",
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      ),
    );
  }
}
