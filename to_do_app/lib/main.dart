// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class Todo {
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}

void main() => runApp(
      const TodoApp(),
    );

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo list',
      // ignore: prefer_const_constructors
      home: new TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => new _TodoListState();
}

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  // ignore: prefer_typing_uninitialized_variables
  final onTodoChanged;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}


class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text(
          'Todo list',
          textAlign: TextAlign.center,
          ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    );
  }


Future<void> _displayDialog() async {
	return showDialog<void>(
	  context: context,
	  barrierDismissible: false, // user must tap button!
	  builder: (BuildContext context) {
	    return AlertDialog(
	      title: const Text('Add a new todo item'),
	      content: TextField(
	        controller: _textFieldController,
	        decoration: const InputDecoration(hintText: 'Type your new todo'),
	      ),
	      actions: <Widget>[
	        TextButton(
	          child: const Text('Add'),
	          onPressed: () {
	            Navigator.of(context).pop();
	            _addTodoItem(_textFieldController.text);
	          },
	        ),
	      ],
	    );
	  },
	);
}

void _addTodoItem(String name) {
	setState(() {
	  _todos.add(Todo(name: name, checked: false));
	});
	_textFieldController.clear();
}

void _handleTodoChange(Todo todo) {
	setState(() {
	  todo.checked = !todo.checked;
	});
}
  // Other functions

  
}

