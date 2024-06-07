import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectpraktpm_156_187/model_data/detail_drink.dart';
import 'package:projectpraktpm_156_187/helper/shared_preference.dart';
import 'package:projectpraktpm_156_187/base_network.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> _favoriteIds = [];
  late SharedPreference _sharedPreference;

  @override
  void initState() {
    super.initState();
    _sharedPreference = SharedPreference();
    _loadFavoriteIds();
  }

  Future<void> _loadFavoriteIds() async {
    final favorites = await _sharedPreference.getFavoriteIds();
    setState(() {
      _favoriteIds = favorites;
    });
  }

  void _toggleFavorite(String id) async {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    await _sharedPreference.setFavoriteIds(_favoriteIds);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
      ),
      body: FutureBuilder<List<String>>(
        future: _sharedPreference.getFavoriteIds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading favorites'),
            );
          } else {
            final favoriteIds = snapshot.data ?? [];
            return ListView.builder(
              itemCount: favoriteIds.length,
              itemBuilder: (context, index) {
                final favoriteId = favoriteIds[index];
                return FutureBuilder(
                  future: BaseNetwork.get('lookup.php?i=$favoriteId'),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasError) {
                      return _buildErrorSection();
                    }
                    if (snapshot.hasData) {
                      final DetailDrink detail = DetailDrink.fromJson(snapshot.data);
                      return _buildSuccessSection(detail);
                    }
                    return _buildLoadingSection();
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return const Text("Error");
  }

  Widget _buildSuccessSection(DetailDrink detail) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(detail.drinks?[0].strDrinkThumb ?? ''),
      ),
      title: Text(detail.drinks?[0].strDrink ?? ''),
      trailing: IconButton(
        onPressed: () {
          _toggleFavorite(detail.drinks?[0].idDrink ?? '');
        },
        icon: Icon(Icons.favorite),
        color: _favoriteIds.contains(detail.drinks?[0].idDrink ?? '') ? Colors.red : Colors.grey,
      ),
      onTap: () {
        // Implementasi aksi ketika item diklik
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
