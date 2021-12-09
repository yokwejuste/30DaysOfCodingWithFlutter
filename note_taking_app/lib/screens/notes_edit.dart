// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../models/note.dart';
import '../models/notes_database.dart';
import '../theme/note_colors.dart';

const c1 = 0xFFFDFFFC, c2 = 0xFFFF595E, c3 = 0xFF374B4A, c4 = 0xFF00B1CC, c5 = 0xFFFFD65C, c6 = 0xFFB9CACA,
    c7 = 0x80374B4A;

class NotesEdit extends StatefulWidget {
    @override
  _NotesEdit createState() => _NotesEdit();
    
}

class _NotesEdit extends State<NotesEdit> {
    String noteTitle = '';
    String noteContent = '';
    String noteColor = 'red';

    TextEditingController _titleTextController = TextEditingController();
    TextEditingController _contentTextController = TextEditingController();

    void handleTitleTextChange() {
        setState(() {
            noteTitle = _titleTextController.text.trim();
        });
    }

    void handleNoteTextChange() {
        setState(() {
            noteContent = _contentTextController.text.trim();
        });
    }

    @override
    void initState() {
        super.initState();
        _titleTextController.addListener(handleTitleTextChange);
        _contentTextController.addListener(handleNoteTextChange);
    }

    @override
    void dispose() {
        _titleTextController.dispose();
        _contentTextController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color(NoteColors[this.noteColor]['l']),
            appBar: AppBar(
                backgroundColor: Color(NoteColors[this.noteColor]['b']),

                leading: IconButton(
                    icon: const Icon(
                        Icons.arrow_back,
                        color: const Color(c1),
                    ),
                    tooltip: 'Back',
                    onPressed: () => {},
                ),

                title: NoteTitleEntry(_titleTextController),
            ),

            body: NoteEntry(_contentTextController),
        );
    }
}

class NoteTitleEntry extends StatelessWidget {
    // ignore: prefer_typing_uninitialized_variables
    final _textFieldController;

    const NoteTitleEntry(this._textFieldController);

    @override
    Widget build(BuildContext context) {
        return TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
                counter: null,
                counterText: "",
                hintText: 'Title',
                hintStyle: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                ),
            ),
            maxLength: 31,
            maxLines: 1,
            style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Color(c1),
            ),
            textCapitalization: TextCapitalization.words,
        );
    }   
}


class NoteEntry extends StatelessWidget {
    // ignore: prefer_typing_uninitialized_variables
    final _textFieldController;

    // ignore: use_key_in_widget_constructors
    const NoteEntry(this._textFieldController);

    @override
    Widget build(BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextField(
                controller: _textFieldController,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: null,
                style: const TextStyle(
                    fontSize: 19,
                    height: 1.5,
                ),
            ),
        );
    }
}
