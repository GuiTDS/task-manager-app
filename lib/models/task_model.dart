enum Category {
  work,
  personal,
  education,
  health,
  finantial,
  house,
  travel,
  others
}

enum Urgency { low, medium, high }

enum Status { toDo, inReview, completed }

class TaskModel {
  final String title;
  final Urgency urgency;
  final Category category;
  final String date;
  Status status;

  TaskModel(
      {required this.title,
      required this.urgency,
      required this.category,
      required this.date,
      required this.status});
}
