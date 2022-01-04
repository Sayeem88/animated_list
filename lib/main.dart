import 'package:animated_list/data/list_items.dart';
import 'package:animated_list/model/list_item.dart';
import 'package:animated_list/widget/listItemWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Animated List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final listKey= GlobalKey<AnimatedListState>();
  final List<ListItem> items = List.from(listItems);
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white10,
      appBar:  AppBar(
        title:  Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body:  AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation)=> ListItemWidget(item: items[index], animation: animation, onClicked: (){})
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: insertItem,
      ),
    );
  }
  void insertItem([int? newIndex]){
    final newIndex=1;
    final newItem= (List.of(listItems)..shuffle()).first;
    items.insert(newIndex, newItem);
    listKey.currentState!;insertItem(
      newIndex,
      // duration: Duration(milliseconds: 600),
    );
  }
  void removeItem(int index){
    final removeItem = items[index];
    items.removeAt(index);
    listKey.currentState!.removeItem(index, (context, animation) => ListItemWidget(
      item: removeItem,
      animation: animation,
      onClicked: (){},
    ),
      duration: Duration(milliseconds: 600),
    );
  }

}

