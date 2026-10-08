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
  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'subtitle':subtitle,
      'isDone':isDone,
      'date':date
    };
  }
}
