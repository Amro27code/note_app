import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/model/note_model.dart';

class HiveHelper<T> {
  String boxName;

  Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  HiveHelper(this.boxName);

  void closeBox(Box b) async {
    await b.close();
  }

  Future<void> addValue({required T value, required String key}) async {
    Box b = await openBox(boxName);
    print(b.values);
    try {
      await b.put(key, value);
    } finally {
      closeBox(b);
      await b.close();
    }
  }

  Future<bool> updateValue({required NoteModel noteModel}) async {
    Box b = await openBox(boxName);
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

  void delete({required int key}) async {
    Box b = await openBox(boxName);
    try {
      if (b.containsKey(key)) {
        await b.delete(key);
      }
    } finally {
      closeBox(b);
    }
  }

  Future<T?> getItem({required String key}) async {
    Box b = await openBox(boxName);
    try {
      // if (b.containsKey(key)) {
      print("------------------");

      var value = b.get(key);
      if (value == null) {
        return null;
      } else if (value is Map) {
        return Map<String, dynamic>.from(value) as T;
      }
      print("Value=>$value");
      return value;
    } finally {
      closeBox(b);
    }
  }

  Future<List<NoteModel>> getAllData() async {
    Box b = await openBox(boxName);
    List value;
    List<NoteModel> notes = [];
    try {
      value = b.values.toList();
      notes = value.map((element) => NoteModel.fromJson(element)).toList();
    } finally {
      closeBox(b);
    }
    return notes;
  }
}
