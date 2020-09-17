class Item {
  final String name;
  final String brand;
  final int price;
  final int key;
//  final String created_time;
//  final String item_url;

  Item({
    this.name,
    this.brand,
    this.price,
    this.key,
  });
}

List<Item> items = [
  Item(
    name: 'スウェット',
    brand: 'AURALEE',
    price: 17600,
    key: 0,
//    created_time: '2020/08/29',
//    item_url: 'https://www.arknets.co.jp/g/gA20AP02NU3kha-gry/',
  ),
  Item(
    name: 'スラックス',
    brand: 'BASIS BROEK',
    price: 10000,
    key: 1,
//    created_time: '2020/08/29',
//    item_url: 'http://lantikimarket.com/?pid=149948364',
  ),
  Item(
    name: 'always pants', brand: 'ka na ta', price: 29700, key: 2,
//    created_time: '2020/08/29',
//    item_url: 'http://dearjoze.shop-pro.jp/?pid=153277856',
  ),
  Item(
    name: 'washableスウェット',
    brand: 'COLINA',
    price: 17600,
    key: 3,
//    created_time: '2020/09/01',
//    item_url: 'https://www.choose-g.jp/204cs06/',
  ),
  Item(
    name: 'ニット', brand: 'yoke', price: 46200, key: 4,
//    created_time: '2020/09/01',
//    item_url: 'https://www.acrmtsm.jp/products/detail/5378/',
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
