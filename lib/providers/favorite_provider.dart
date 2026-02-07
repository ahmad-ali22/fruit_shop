import 'package:flutter/cupertino.dart';
import 'package:fruit_shop/data/data.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> favorites = [];

  void toggleFavorites(Product product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
    notifyListeners();
  }


  bool isExist(Product product) {
    final isExist = favorites.contains(product);
    return isExist;
  }
}
