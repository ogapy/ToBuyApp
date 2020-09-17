import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:tobuy_app/item.dart';

import 'color.dart';
import 'format.dart';

class ItemList extends StatefulWidget {
  int total;
  final Function refresh;

  ItemList({Key key, this.total, @required this.refresh}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ImplicitlyAnimatedReorderableList<Item>(
      items: items,
      padding: EdgeInsets.only(top: 30.0),
      areItemsTheSame: (oldItem, newItem) => oldItem.key == newItem.key,
      onReorderFinished: (item, from, to, newItems) {
        setState(() {
          items
            ..clear()
            ..addAll(newItems);
        });
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
                          onTap: () async {
                            setState(() {
                              reduce(item);
                              items.remove(item);
                              widget.refresh(item.price);
                            });
                          },
                        )
                      ],
                      child: ListTile(
                        leading: ConstrainedBox(
                          constraints:
                              BoxConstraints.expand(width: 150.0, height: 50.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
// 商品名
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    color: kPrimaryText,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
// ブランド名
                                Text(
                                  item.brand,
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
// 料金
                              Text(
                                '¥${formatter.format(item.price).toString()}',
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
                      ),
                    ),
                  ),
                ));
          },
        );
      },
    );
  }
}
