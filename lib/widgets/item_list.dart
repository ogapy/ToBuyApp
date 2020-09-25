import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:provider/provider.dart';
import 'package:tobuy_app/models/item.dart';
import 'package:tobuy_app/models/item_data.dart';
import 'package:tobuy_app/widgets/item_tile.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
      builder: (context, itemData, child) {
        return ImplicitlyAnimatedReorderableList<Item>(
          items: itemData.items,
          padding: EdgeInsets.only(top: 30.0),
          areItemsTheSame: (oldItem, newItem) => oldItem.key == newItem.key,
          onReorderFinished: (item, from, to, newItems) {
            itemData.reorder(newItems);
          },
          itemBuilder: (context, itemAnimation, item, index) {
            return Reorderable(
              key: ValueKey(item.key.toString()),
              builder: (context, dragAnimation, isDrag) {
                return SizeFadeTransition(
                  sizeFraction: 0.7,
                  curve: Curves.easeInOut,
                  axis: Axis.horizontal,
                  animation: itemAnimation,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Slidable(
                        actionPane: SlidableScrollActionPane(),
                        secondaryActions: [
                          IconSlideAction(
                            closeOnTap: false,
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              itemData.deleteItem(item); //
                            },
                          )
                        ],
                        child: ItemTile(
                          itemName: item.name,
                          itemBrand: item.brand,
                          itemPrice: item.price,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
