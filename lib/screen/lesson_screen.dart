import 'package:flutter/material.dart';
import 'package:revise/models/item.dart';

class LessonScreen extends StatefulWidget {
  final Item item;

  LessonScreen(this.item);

  @override
  State<StatefulWidget> createState() {
    return _ItemDetailState();
  }
}

class _ItemDetailState extends State<LessonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
      ),
      body: Center(),
    );
  }
}
