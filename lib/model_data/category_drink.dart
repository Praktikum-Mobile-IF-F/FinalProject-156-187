class CategoryDrink {
  List<Drinks>? drinks;

  CategoryDrink({
    this.drinks,
  });

  CategoryDrink.fromJson(Map<String, dynamic> json) {
    drinks = (json['drinks'] as List?)?.map((dynamic e) => Drinks.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['drinks'] = drinks?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Drinks {
  String? strDrink;
  String? strDrinkThumb;
  String? idDrink;

  Drinks({
    this.strDrink,
    this.strDrinkThumb,
    this.idDrink,
  });

  Drinks.fromJson(Map<String, dynamic> json) {
    strDrink = json['strDrink'] as String?;
    strDrinkThumb = json['strDrinkThumb'] as String?;
    idDrink = json['idDrink'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['strDrink'] = strDrink;
    json['strDrinkThumb'] = strDrinkThumb;
    json['idDrink'] = idDrink;
    return json;
  }
}