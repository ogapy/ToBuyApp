import 'item.dart';

List<Item> items = [
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

int getAmount() {
  int amount = 0;
  for (int i = 0; i < items.length; i++) {
    amount += items[i].price;
  }
  return amount;
}

int reduce(Item item) {
  int amount = getAmount();
  return amount - item.price;
}
