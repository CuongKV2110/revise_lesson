import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revise/models/item.dart';

import 'itemdetail_screen.dart';
import 'lesson_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> _list = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    _list.add(
      Item(
          name: 'Lesson',
          url:
              'https://d338t8kmirgyke.cloudfront.net/icons/icon_pngs/000/008/865/original/open-book2.png'),
    );
    _list.add(
      Item(
          name: 'Messenger',
          url:
              'https://icons-for-free.com/iconfiles/png/512/facebook+line+icon+media+messenger+social+icon-1320192335537793855.png'),
    );
    _list.add(
      Item(
          name: 'Profile',
          url:
              'https://i.pinimg.com/originals/0c/3b/3a/0c3b3adb1a7530892e55ef36d3be6cb8.png'),
    );
    _list.add(
      Item(
          name: 'Lesson',
          url:
              'https://upload.wikimedia.org/wikipedia/commons/6/6d/Windows_Settings_app_icon.png'),
    );
    _list.add(
      Item(
          name: 'Note',
          url: 'https://icon-library.com/images/icon-note/icon-note-17.jpg'),
    );
    _list.add(
      Item(
          name: 'Watch',
          url: 'https://static.thenounproject.com/png/3541697-200.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revise"),
      ),
      body: GridView.builder(
        itemCount: _list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0),
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(_list[index].url),
                ),
                Text(_list[index].name)
              ],
            ),
            onTap: () {
              _openItemScreen(_list[index]);
            },
          );
        },
      ),
    );
  }

  void _openItemScreen(Item item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          if (item.name == 'Lesson') {
            return LessonScreen(item);
          }
          return ItemDetailScreen(item);
        },
      ),
    );
  }
}
