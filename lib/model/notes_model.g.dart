// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notesmodelAdapter extends TypeAdapter<notesmodel> {
  @override
  final int typeId = 0;

  @override
  notesmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notesmodel(
      title: fields[0] as String,
      describtion: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, notesmodel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.describtion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notesmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
