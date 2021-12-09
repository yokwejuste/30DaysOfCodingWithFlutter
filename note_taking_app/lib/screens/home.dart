import 'package:flutter/material.dart';
import './notes_edit.dart';

const c1 = 0xFFFDFFFC,
    c2 = 0xFFFF595E,
    c3 = 0xFF374B4A,
    c4 = 0xFF00B1CC,
    c5 = 0xFFFFD65C,
    c6 = 0xFFB9CACA,
    c7 = 0x80374B4A,
    c8 = 0x3300B1CC,
    c9 = 0xCCFF595E;

// Home Screen
class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steve\'s Notes',
      home: Scaffold(
        backgroundColor: Color(c6),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(c2),
          brightness: Brightness.dark,
          title: Text(
            'Super Note',
            style: TextStyle(
              color: const Color(c5),
            ),
          ),
        ),

        //Floating Button
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              color: const Color(c5),
            ),
            tooltip: 'New Notes',
            backgroundColor: const Color(c4),
            // Go to Edit screen
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesEdit()),
              );
            }),
      ),
    );
  }
}
