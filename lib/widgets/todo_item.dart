import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.completed ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: todo.completed,
        onChanged: (value) {
          ref.read(todoProvider.notifier).toggle(todo.id);
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          ref.read(todoProvider.notifier).remove(todo.id);
        },
      ),
    );
  }
}
