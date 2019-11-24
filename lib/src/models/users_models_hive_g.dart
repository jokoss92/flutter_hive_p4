// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_models_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersModelsHiveAdapter extends TypeAdapter<UsersModelsHive> {
  @override
  UsersModelsHive read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsersModelsHive()
      ..id = fields[0] as String
      ..username = fields[1] as String
      ..email = fields[2] as String
      ..password = fields[3] as String
      ..avatar = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, UsersModelsHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.avatar);
  }
}
