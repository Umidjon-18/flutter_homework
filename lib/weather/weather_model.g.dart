// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 0;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      date: fields[0] as String?,
      today: (fields[1] as List?)?.cast<dynamic>(),
      weekDays: (fields[2] as List?)?.cast<dynamic>(),
      days: (fields[3] as List?)?.cast<dynamic>(),
      tempDay: (fields[4] as List?)?.cast<dynamic>(),
      tempNight: (fields[5] as List?)?.cast<dynamic>(),
      feeling: (fields[6] as List?)?.cast<dynamic>(),
      rainPerc: (fields[7] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.today)
      ..writeByte(2)
      ..write(obj.weekDays)
      ..writeByte(3)
      ..write(obj.days)
      ..writeByte(4)
      ..write(obj.tempDay)
      ..writeByte(5)
      ..write(obj.tempNight)
      ..writeByte(6)
      ..write(obj.feeling)
      ..writeByte(7)
      ..write(obj.rainPerc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
