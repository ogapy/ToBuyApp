import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobuy_app/models/item_data.dart';
import 'package:tobuy_app/widgets/item_form.dart';

class NewItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newItemName;
    String newItemBrand;
    int newItemPrice;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0),
        ),
        title: Text(
          'New Item',
          style: TextStyle(fontSize: 25.0),
        ),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          height: double.infinity,
          child: Column(
            children: [
              // 商品名フォーム
              ItemForm(
                formLabel: 'Name',
                isPrice: false,
                itemFormCallback: (var property) {
                  newItemName = property;
                },
              ),
              // ブランドフォーム
              ItemForm(
                formLabel: 'Brand',
                isPrice: false,
                itemFormCallback: (var property) {
                  newItemBrand = property;
                },
              ),
              // 金額フォーム
              ItemForm(
                formLabel: 'Price',
                isPrice: true,
                itemFormCallback: (var property) {
                  newItemPrice = property;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 130.0,
                      height: 50.0,
                      child: RaisedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          size: 25.0,
                        ),
                        label: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    SizedBox(
                      width: 130.0,
                      height: 50.0,
                      child: RaisedButton.icon(
                        onPressed: () {
                          Provider.of<ItemData>(context, listen: false)
                              .addItem(newItemName, newItemBrand, newItemPrice);
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.check,
                          size: 25.0,
                        ),
                        label: Text(
                          'OK',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
