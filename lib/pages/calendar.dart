import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_to_do/models/salvar_tarefa.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now(); //dia atual colorido 
  DateTime? _selectedDay; //dia clicado pelo user

  @override
  Widget build(BuildContext context) {
    final saveTask = context.watch<SaveTask>();

    // pegar dias com tarefas concluídas
    final completedDays = saveTask.tasks
        .where((task) => task.isCompleted) //filtra as tarefas concluidas em tal dia clicado
        .map((task) => task.completedDate) //pega a data
        .whereType<DateTime>() //not null
        .toSet();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              //dia selecionado para aparecer tarefas concluidas
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            eventLoader: (day) {
              // carrega as tarefas concluidas num dia especifico
              if (completedDays.contains(day)) {
                return ['Tarefa Concluída']; //mostra as tarefas concluidas(se tiver)
              }
              return [];
            },
          ),
          const SizedBox(height: 20),
          if (_selectedDay != null)
            Expanded(
              child: ListView(
                children: saveTask.tasks
                    .where((task) =>
                        task.isCompleted &&
                        isSameDay(task.completedDate, _selectedDay))
                    .map((task) => ListTile(
                          title: Text(task.title),
                          leading: const Icon(Icons.check_circle,
                              color: Colors.green),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}