class NoteModel {
  final int id;
  final bool isDone;

  final String date, title, subtitle;

  const NoteModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.isDone,
  });

  factory NoteModel.fromJson(Map json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      date: json['date'],
      isDone: json['isDone'],
    );
  }

  @override
  String toString() {
    return 'NoteModel{id: $id, isDone: $isDone, date: $date, title: $title, subtitle: $subtitle}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'isDone': isDone,
      'date': date,
    };
  }
}
