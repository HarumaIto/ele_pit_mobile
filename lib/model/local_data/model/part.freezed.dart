// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Part _$PartFromJson(Map<String, dynamic> json) {
  return _Part.fromJson(json);
}

/// @nodoc
mixin _$Part {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;

  /// Serializes this Part to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PartCopyWith<Part> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartCopyWith<$Res> {
  factory $PartCopyWith(Part value, $Res Function(Part) then) =
      _$PartCopyWithImpl<$Res, Part>;
  @useResult
  $Res call(
      {int id, String name, int quantity, String location, String? imagePath});
}

/// @nodoc
class _$PartCopyWithImpl<$Res, $Val extends Part>
    implements $PartCopyWith<$Res> {
  _$PartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? location = null,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartImplCopyWith<$Res> implements $PartCopyWith<$Res> {
  factory _$$PartImplCopyWith(
          _$PartImpl value, $Res Function(_$PartImpl) then) =
      __$$PartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, int quantity, String location, String? imagePath});
}

/// @nodoc
class __$$PartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$PartImpl>
    implements _$$PartImplCopyWith<$Res> {
  __$$PartImplCopyWithImpl(_$PartImpl _value, $Res Function(_$PartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? location = null,
    Object? imagePath = freezed,
  }) {
    return _then(_$PartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartImpl implements _Part {
  const _$PartImpl(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.location,
      this.imagePath});

  factory _$PartImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int quantity;
  @override
  final String location;
  @override
  final String? imagePath;

  @override
  String toString() {
    return 'Part(id: $id, name: $name, quantity: $quantity, location: $location, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, quantity, location, imagePath);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartImplCopyWith<_$PartImpl> get copyWith =>
      __$$PartImplCopyWithImpl<_$PartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartImplToJson(
      this,
    );
  }
}

abstract class _Part implements Part {
  const factory _Part(
      {required final int id,
      required final String name,
      required final int quantity,
      required final String location,
      final String? imagePath}) = _$PartImpl;

  factory _Part.fromJson(Map<String, dynamic> json) = _$PartImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get quantity;
  @override
  String get location;
  @override
  String? get imagePath;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartImplCopyWith<_$PartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
