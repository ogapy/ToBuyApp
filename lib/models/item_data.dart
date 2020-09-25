import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'item.dart';

class ItemData extends ChangeNotifier {
  List<Item> _items = [
    Item(
      name: 'スウェット',
      brand: 'AURALEE',
      price: 17600,
      key: 0,
    ),
    Item(
      name: 'スラックス',
      brand: 'BASIS BROEK',
      price: 10000,
      key: 1,
    ),
    Item(
      name: 'always pants',
      brand: 'ka na ta',
      price: 29700,
      key: 2,
    ),
    Item(
      name: 'washableスウェット',
      brand: 'COLINA',
      price: 17600,
      key: 3,
    ),
    Item(
      name: 'ニット',
      brand: 'yoke',
      price: 46200,
      key: 4,
    ),
  ];

  UnmodifiableListView<Item> get items {
    return UnmodifiableListView(_items);
  }

  int get totalAmount {
    return _items.map<int>((m) => m.price).reduce((a, b) => a + b);
  }

  void addItem(String newItemName, String newItemBrand, int newItemPrice) {
    final item = Item(
      name: newItemName,
      brand: newItemBrand,
      price: newItemPrice,
      key: _items.length,
    );
    _items.add(item);
    notifyListeners();
  }

  void deleteItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void reorder(List<Item> newItems) {
    _items
      ..clear()
      ..addAll(newItems);
  }
}
