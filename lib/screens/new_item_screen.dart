import 'package:flutter/material.dart';
import 'package:tobuy_app/models/item.dart';

class NewItemScreen extends StatefulWidget {
  @override
  _NewItemScreenState createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _priceController = TextEditingController();

  Item _addItem(String name, String brand, int price) {
    return Item(
      name: name,
      brand: brand,
      price: price,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
//                hintText: 'New Item',
                    labelText: 'New Item',
                  ),
                ),
              ),
              // ブランドフォーム
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextField(
                  controller: _brandController,
                  decoration: InputDecoration(
//                hintText: 'New Item',
                    labelText: 'Brand',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.settings_backup_restore,
                        size: 30.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                  ),
                ),
              ),
              // 金額フォーム
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
//                hintText: 'New Item',
                    labelText: 'Price',
                  ),
                ),
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
                          final Item new_item = _addItem(
                            _nameController.text,
                            _brandController.text,
                            int.parse(_priceController.text),
                          );

                          _nameController.clear();
                          _brandController.clear();
                          _priceController.clear();
                          Navigator.pop(context, new_item);
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
