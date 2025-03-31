class Task {
  final String title;
  bool isCompleted;
  DateTime? completedDate; // conclusao da tarefa

  Task({
    required this.title,
    this.isCompleted = false,
    this.completedDate,
  });

  void toggleCompletion() {
    isCompleted = !isCompleted;
    completedDate = isCompleted ? DateTime.now() : null;
  }
}