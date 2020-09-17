import 'package:flutter/material.dart';
import 'package:tobuy_app/item.dart';

import 'color.dart';
import 'format.dart';

class ItemList extends StatefulWidget {
  ItemList({Key key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: EdgeInsets.only(
        top: 20.0,
        right: 10.0,
        left: 25.0,
      ),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final Item item = items.removeAt(oldIndex);
          items.insert(newIndex, item);
        });
      },
      children: List.generate(items.length, (index) {
        final item = items[index];
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          key: Key(item.key.toString()),
          margin: EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.expand(width: 170.0, height: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 商品名
                    Text(
                      item.name,
                      style: TextStyle(
                        color: kPrimaryText,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    // ブランド名
                    Text(
                      item.brand,
                      style: TextStyle(
                          color: kSecondaryText,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.expand(
                  width: 120.0,
                  height: 50.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    // 料金
                    Text(
                      '¥${formatter.format(item.price).toString()}',
                      style: TextStyle(
                        color: kPrimaryText,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.link,
                ),
                onPressed: () {},
              ),
            ],
          ),
        );
      }),
    );
  }
}
