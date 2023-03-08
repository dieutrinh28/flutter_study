import 'package:flutter/material.dart';
import 'package:flutter_crud/screen/add_page.dart';
import 'package:flutter_crud/services/todo_service.dart';
import 'package:flutter_crud/utils/snackbar_helper.dart';
import 'package:flutter_crud/widget/todo_card.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  Future<void> onAddTodoClick() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddPage(),
      ),
    );
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> onEditTodoClick(Map item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPage(todo: item),
      ),
    );
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> fetchTodo() async {
    final response = await TodoService.fetchTodo();
    if (response != null) {
      setState(() {
        items = response;
      });
    } else {
      showErrorMessage(context, message: 'Something went wrong');
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteById(String id) async {
    final isSuccess = await TodoService.deleteById(id);
    if (isSuccess) {
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      showErrorMessage(context, message: 'Deletion Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
            onRefresh: fetchTodo,
            child: Visibility(
              visible: items.isNotEmpty,
              replacement: const Center(
                child: Text('No Todo Item'),
              ),
              child: ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final item = items[index] as Map;
                  final id = item['_id'] as String;
                  return TodoCard(
                    index: index,
                    item: item,
                    onEditTodoClick: onEditTodoClick,
                    deleteById: deleteById,
                  );
                },
              ),
            )),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onAddTodoClick,
        label: const Text('Add todo'),
      ),
    );
  }
}
