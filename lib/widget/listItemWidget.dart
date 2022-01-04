import 'package:animated_list/model/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;


  ListItemWidget({required this.item, required this.animation, this.onClicked});


  @override
  Widget build(BuildContext context) => SizeTransition(
    key: ValueKey(item.urlImage),
    sizeFactor: animation,
    child: buildItem(),
  );

  Widget buildItem()=> Container(
    margin: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.all(16.0),
      leading: CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(item.urlImage),
      ),
      title: Text(item.title),
      trailing: IconButton(
        icon: Icon(Icons.delete,size: 32,),
        onPressed: onClicked,
      ),
    ),
  );

}
