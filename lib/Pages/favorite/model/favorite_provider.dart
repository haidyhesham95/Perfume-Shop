import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'favorite_model.dart';

class FavoriteProvider with ChangeNotifier {
  final Map<String, FavoriteModel> _favoriteItems = {};

  Map<String, FavoriteModel> get getFavoriteItems {
    return _favoriteItems;
  }

  bool isProductInFavorite({required String productId}) {
    return _favoriteItems.containsKey(productId);
  }

  void addOrRemoveFromFavorite({required String productId}) {
    if (_favoriteItems.containsKey(productId)) {
      _favoriteItems.remove(productId);
    } else {
      _favoriteItems.putIfAbsent(
        productId,
        () => FavoriteModel(
          id: const Uuid().v4(),
          productId: productId,
        ),
      );
    }

    notifyListeners();
  }

  void clearLocalFavorite() {
    _favoriteItems.clear();
    notifyListeners();
  }
}
