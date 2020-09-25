import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:tobuy_app/properties/color.dart';
import 'package:tobuy_app/properties/format.dart';

class ItemTile extends StatelessWidget {
  final String itemName;
  final String itemBrand;
  final int itemPrice;

  ItemTile({
    this.itemName,
    this.itemBrand,
    this.itemPrice,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints.expand(width: 150.0, height: 50.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                itemName,
                style: TextStyle(
                  color: kPrimaryText,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                itemBrand,
                style: TextStyle(
                    color: kSecondaryText,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      title: ConstrainedBox(
        constraints: BoxConstraints.expand(
          width: 120.0,
          height: 50.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.0,
            ),
            Text(
              '¥${formatter.format(itemPrice)}',
              style: TextStyle(
                color: kPrimaryText,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Handle(
          delay: Duration(microseconds: 100),
          child: Icon(
            Icons.list,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
