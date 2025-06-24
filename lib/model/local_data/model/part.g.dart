// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartImpl _$$PartImplFromJson(Map<String, dynamic> json) => _$PartImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      location: json['location'] as String,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$$PartImplToJson(_$PartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'location': instance.location,
      'imagePath': instance.imagePath,
    };
