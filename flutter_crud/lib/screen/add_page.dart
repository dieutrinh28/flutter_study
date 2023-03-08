import 'package:flutter/material.dart';
import 'package:flutter_crud/services/todo_service.dart';

import '../utils/snackbar_helper.dart';

class AddPage extends StatefulWidget {
  final Map? todo;
  const AddPage({
    Key? key,
    this.todo,
  }) : super(key: key);

  @override
  State<AddPage> createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> submitData() async {
    //Submit data to the server
    final isSuccess = await TodoService.addTodo(body);

    //Show success or fail message based on status

    if (isSuccess) {
      titleController.text = '';
      descriptionController.text = '';
      showSuccessMessage(context, message: 'Creation Success');
    } else {
      showErrorMessage(context, message: 'Creation Failed');
    }
  }

  Map get body {
    //Get data from the AddTodo Form

    final title = titleController.text;
    final description = descriptionController.text;
    return {
      'title': title,
      'description': description,
      'isComplete': false,
    };
  }

  Future<void> updateData() async {
    final todo = widget.todo;
    if (todo == null) {
      return;
    }
    final id = todo['_id'];

    final isSuccess = await TodoService.updateTodo(id, body);

    if (isSuccess) {
      showSuccessMessage(context, message: 'Update Success');
    } else {
      showErrorMessage(context, message: 'Update Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? 'Edit Todo' : 'Add Todo',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.lightGreen),
            ),
            onPressed: isEdit ? updateData : submitData,
            child: Text(
              isEdit ? 'Update' : 'Submit',
            ),
          ),
        ],
      ),
    );
  }
}
