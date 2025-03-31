import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_to_do/models/tarefa.dart';
import 'package:flutter_to_do/models/salvar_tarefa.dart';
import 'package:flutter_to_do/models/theme_provider.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool _isGridView = false;  // listView e gridView

  @override
  Widget build(BuildContext context) {
    final saveTask = context.watch<SaveTask>(); 
    final themeProvider = context.watch<ThemeProvider>(); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas Diárias'),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView; 
              });
            },
          ),
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              themeProvider.toggleTheme(); // dark e light mode
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context, saveTask); // pop up dialog para adicionar as tarefas
        },
        child: const Icon(Icons.add),
      ),
      body: saveTask.tasks.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma tarefa adicionada.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : _isGridView
              ? GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: saveTask.tasks.length,
                  itemBuilder: (context, index) {
                    final task = saveTask.tasks[index]; //pega a tarefa pelo index
                    return _buildTaskCard(task, saveTask, index);
                  },
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: saveTask.tasks.length,
                  itemBuilder: (context, index) {
                    final task = saveTask.tasks[index]; 
                    return _buildTaskCard(task, saveTask, index);
                  },
                ),
    );
  }

 Widget _buildTaskCard(Task task, SaveTask saveTask, int index) {
  return Card(
    elevation: 4,
    child: ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Wrap(
        spacing: 8.0, 
        children: [
          IconButton(
            icon: Icon(
              task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: task.isCompleted ? Colors.green : Colors.grey,
            ),
            onPressed: () {
              saveTask.checkTask(index); // marca a tarefa como concluida
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Color.fromARGB(255, 64, 64, 64)),
            onPressed: () {
              saveTask.removeTask(task); // remove tarefa
            },
          ),
        ],
      ),
    ),
  );
}

  void _showAddTaskDialog(BuildContext context, SaveTask saveTask) {
    final TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Tarefa'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Digite o título da tarefa'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  saveTask.addTask(Task(
                    title: taskController.text,
                    isCompleted: false,
                  ));
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}