import 'package:hive/hive.dart';
part 'notes_model.g.dart';

@HiveType(typeId: 0)
class notesmodel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String describtion;

  notesmodel({required this.title, required this.describtion});
}
