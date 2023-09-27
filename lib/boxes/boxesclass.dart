import 'package:flutter__hive/model/notes_model.dart';
import 'package:hive/hive.dart';

class boxes {
  static Box<notesmodel> getData() => Hive.box<notesmodel>("notes");
}
