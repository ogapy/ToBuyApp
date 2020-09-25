import 'package:flutter/material.dart';

class ItemForm extends StatelessWidget {
  final String formLabel;
  final Function itemFormCallback;
  final bool isPrice;

  ItemForm({this.formLabel, this.itemFormCallback, this.isPrice});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
        left: 20.0,
        right: 20.0,
      ),
      child: TextField(
        keyboardType: isPrice ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: formLabel,
        ),
        onChanged: (value) {
          isPrice
              ? itemFormCallback(int.parse(value))
              : itemFormCallback(value);
        },
      ),
    );
  }
}
