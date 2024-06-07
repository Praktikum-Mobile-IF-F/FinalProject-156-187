class DetailDrink {
  List<Drinks>? drinks;

  DetailDrink({
    this.drinks,
  });

  DetailDrink.fromJson(Map<String, dynamic> json) {
    drinks = (json['drinks'] as List?)?.map((dynamic e) => Drinks.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['drinks'] = drinks?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Drinks {
  String? idDrink;
  String? strDrink;
  dynamic strDrinkAlternate;
  dynamic strTags;
  dynamic strVideo;
  String? strCategory;
  dynamic strIBA;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  dynamic strInstructionsES;
  String? strInstructionsDE;
  dynamic strInstructionsFR;
  String? strInstructionsIT;
  dynamic strInstructionsZH_HANS;
  dynamic strInstructionsZH_HANT;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  dynamic strIngredient5;
  dynamic strIngredient6;
  dynamic strIngredient7;
  dynamic strIngredient8;
  dynamic strIngredient9;
  dynamic strIngredient10;
  dynamic strIngredient11;
  dynamic strIngredient12;
  dynamic strIngredient13;
  dynamic strIngredient14;
  dynamic strIngredient15;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  dynamic strMeasure5;
  dynamic strMeasure6;
  dynamic strMeasure7;
  dynamic strMeasure8;
  dynamic strMeasure9;
  dynamic strMeasure10;
  dynamic strMeasure11;
  dynamic strMeasure12;
  dynamic strMeasure13;
  dynamic strMeasure14;
  dynamic strMeasure15;
  dynamic strImageSource;
  dynamic strImageAttribution;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  Drinks({
    this.idDrink,
    this.strDrink,
    this.strDrinkAlternate,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIBA,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsES,
    this.strInstructionsDE,
    this.strInstructionsFR,
    this.strInstructionsIT,
    this.strInstructionsZH_HANS,
    this.strInstructionsZH_HANT,
    this.strDrinkThumb,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  Drinks.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'] as String?;
    strDrink = json['strDrink'] as String?;
    strDrinkAlternate = json['strDrinkAlternate'];
    strTags = json['strTags'];
    strVideo = json['strVideo'];
    strCategory = json['strCategory'] as String?;
    strIBA = json['strIBA'];
    strAlcoholic = json['strAlcoholic'] as String?;
    strGlass = json['strGlass'] as String?;
    strInstructions = json['strInstructions'] as String?;
    strInstructionsES = json['strInstructionsES'];
    strInstructionsDE = json['strInstructionsDE'] as String?;
    strInstructionsFR = json['strInstructionsFR'];
    strInstructionsIT = json['strInstructionsIT'] as String?;
    strInstructionsZH_HANS = json['strInstructionsZH-HANS'];
    strInstructionsZH_HANT = json['strInstructionsZH-HANT'];
    strDrinkThumb = json['strDrinkThumb'] as String?;
    strIngredient1 = json['strIngredient1'] as String?;
    strIngredient2 = json['strIngredient2'] as String?;
    strIngredient3 = json['strIngredient3'] as String?;
    strIngredient4 = json['strIngredient4'] as String?;
    strIngredient5 = json['strIngredient5'];
    strIngredient6 = json['strIngredient6'];
    strIngredient7 = json['strIngredient7'];
    strIngredient8 = json['strIngredient8'];
    strIngredient9 = json['strIngredient9'];
    strIngredient10 = json['strIngredient10'];
    strIngredient11 = json['strIngredient11'];
    strIngredient12 = json['strIngredient12'];
    strIngredient13 = json['strIngredient13'];
    strIngredient14 = json['strIngredient14'];
    strIngredient15 = json['strIngredient15'];
    strMeasure1 = json['strMeasure1'] as String?;
    strMeasure2 = json['strMeasure2'] as String?;
    strMeasure3 = json['strMeasure3'] as String?;
    strMeasure4 = json['strMeasure4'] as String?;
    strMeasure5 = json['strMeasure5'];
    strMeasure6 = json['strMeasure6'];
    strMeasure7 = json['strMeasure7'];
    strMeasure8 = json['strMeasure8'];
    strMeasure9 = json['strMeasure9'];
    strMeasure10 = json['strMeasure10'];
    strMeasure11 = json['strMeasure11'];
    strMeasure12 = json['strMeasure12'];
    strMeasure13 = json['strMeasure13'];
    strMeasure14 = json['strMeasure14'];
    strMeasure15 = json['strMeasure15'];
    strImageSource = json['strImageSource'];
    strImageAttribution = json['strImageAttribution'];
    strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'] as String?;
    dateModified = json['dateModified'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['idDrink'] = idDrink;
    json['strDrink'] = strDrink;
    json['strDrinkAlternate'] = strDrinkAlternate;
    json['strTags'] = strTags;
    json['strVideo'] = strVideo;
    json['strCategory'] = strCategory;
    json['strIBA'] = strIBA;
    json['strAlcoholic'] = strAlcoholic;
    json['strGlass'] = strGlass;
    json['strInstructions'] = strInstructions;
    json['strInstructionsES'] = strInstructionsES;
    json['strInstructionsDE'] = strInstructionsDE;
    json['strInstructionsFR'] = strInstructionsFR;
    json['strInstructionsIT'] = strInstructionsIT;
    json['strInstructionsZH-HANS'] = strInstructionsZH_HANS;
    json['strInstructionsZH-HANT'] = strInstructionsZH_HANT;
    json['strDrinkThumb'] = strDrinkThumb;
    json['strIngredient1'] = strIngredient1;
    json['strIngredient2'] = strIngredient2;
    json['strIngredient3'] = strIngredient3;
    json['strIngredient4'] = strIngredient4;
    json['strIngredient5'] = strIngredient5;
    json['strIngredient6'] = strIngredient6;
    json['strIngredient7'] = strIngredient7;
    json['strIngredient8'] = strIngredient8;
    json['strIngredient9'] = strIngredient9;
    json['strIngredient10'] = strIngredient10;
    json['strIngredient11'] = strIngredient11;
    json['strIngredient12'] = strIngredient12;
    json['strIngredient13'] = strIngredient13;
    json['strIngredient14'] = strIngredient14;
    json['strIngredient15'] = strIngredient15;
    json['strMeasure1'] = strMeasure1;
    json['strMeasure2'] = strMeasure2;
    json['strMeasure3'] = strMeasure3;
    json['strMeasure4'] = strMeasure4;
    json['strMeasure5'] = strMeasure5;
    json['strMeasure6'] = strMeasure6;
    json['strMeasure7'] = strMeasure7;
    json['strMeasure8'] = strMeasure8;
    json['strMeasure9'] = strMeasure9;
    json['strMeasure10'] = strMeasure10;
    json['strMeasure11'] = strMeasure11;
    json['strMeasure12'] = strMeasure12;
    json['strMeasure13'] = strMeasure13;
    json['strMeasure14'] = strMeasure14;
    json['strMeasure15'] = strMeasure15;
    json['strImageSource'] = strImageSource;
    json['strImageAttribution'] = strImageAttribution;
    json['strCreativeCommonsConfirmed'] = strCreativeCommonsConfirmed;
    json['dateModified'] = dateModified;
    return json;
  }
}