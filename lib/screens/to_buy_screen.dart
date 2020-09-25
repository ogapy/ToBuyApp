import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobuy_app/models/item_data.dart';
import 'package:tobuy_app/properties/format.dart';
import 'package:tobuy_app/widgets/item_list.dart';

import 'new_item_screen.dart';

class ToBuyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: Icon(Icons.menu),
            iconSize: Theme.of(context).iconTheme.size,
            onPressed: () {},
          ),
        ),
        title: Text(
          'TOBUY List',
          style: TextStyle(fontSize: 25.0),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.search),
              iconSize: Theme.of(context).iconTheme.size,
              onPressed: () {},
            ),
          ),
        ],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewItemScreen()),
          );
        },
      ),
      body: Column(
        children: [
          // 上部
          Container(
            padding: EdgeInsets.only(top: 20.0),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'TOTAL',
                    style: TextStyle(color: Colors.grey[400], fontSize: 22.0),
                  ),
                  // 合計金額
                  Text(
                    '¥${formatter.format(Provider.of<ItemData>(context).totalAmount)}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          // 下部
          Expanded(
            child: Container(
              height: 500.0,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                  topRight: Radius.circular(60.0),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  // リスト
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60.0),
                      topLeft: Radius.circular(60.0),
                    ),
                    child: ItemList(),
                  ),
                  // +ボタン
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
