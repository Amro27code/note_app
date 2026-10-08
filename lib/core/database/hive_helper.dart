import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/model/note_model.dart';

class HiveHelper<T> {
  String boxName1 = "NotesBox";

  Future<Box<T>> openBox() async {
    Box<T> b = await Hive.openBox<T>("name");
    return b;
  }

  void closeBox(Box<T> b) async {
    await b.close();
  }

  void addValue(NoteModel noteModel) async {
    Box<T> b = await openBox();
    try {
      if (T is Map) {
        await b.put(noteModel.id, noteModel.toJson() as T);
      }
    } finally {
      closeBox(b);
    }
  }

  Future<bool> updateValue(NoteModel noteModel) async {
    Box<T> b = await openBox();
    bool founded = false;
    try {
      if (b.containsKey(noteModel.id)) {
        founded = true;
        await b.put(noteModel.id, noteModel.toJson() as T);
      }
    } finally {
      closeBox(b);
    }
    return founded;
  }

  void delete(int key) async {
    Box<T> b = await openBox();
    try {
      if (b.containsKey(key)) {
        await b.delete(key);
      }
    } finally {
      closeBox(b);
    }
  }

  Future<T?> getItem(int key) async {
    Box<T> b = await openBox();
    T? value;
    try {
      if (b.containsKey(key)) {
        value = b.get(key);
      }
    } finally {
      closeBox(b);
    }
    return value;
  }
}
