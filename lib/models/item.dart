class Item {
  final String name;
  final String brand;
  final int price;
  final int key;
  bool isBought;
//  final String created_time;
//  final String item_url;

  Item({
    this.name,
    this.brand,
    this.price,
    this.key,
    this.isBought = false,
  });
}
