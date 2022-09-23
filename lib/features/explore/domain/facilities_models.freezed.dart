// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'facilities_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilitiesModels _$FacilitiesModelsFromJson(Map<String, dynamic> json) {
  return _FacilitiesModels.fromJson(json);
}

/// @nodoc
mixin _$FacilitiesModels {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilitiesModelsCopyWith<FacilitiesModels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilitiesModelsCopyWith<$Res> {
  factory $FacilitiesModelsCopyWith(
          FacilitiesModels value, $Res Function(FacilitiesModels) then) =
      _$FacilitiesModelsCopyWithImpl<$Res>;
  $Res call({int id, String name, String image});
}

/// @nodoc
class _$FacilitiesModelsCopyWithImpl<$Res>
    implements $FacilitiesModelsCopyWith<$Res> {
  _$FacilitiesModelsCopyWithImpl(this._value, this._then);

  final FacilitiesModels _value;
  // ignore: unused_field
  final $Res Function(FacilitiesModels) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FacilitiesModelsCopyWith<$Res>
    implements $FacilitiesModelsCopyWith<$Res> {
  factory _$$_FacilitiesModelsCopyWith(
          _$_FacilitiesModels value, $Res Function(_$_FacilitiesModels) then) =
      __$$_FacilitiesModelsCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String image});
}

/// @nodoc
class __$$_FacilitiesModelsCopyWithImpl<$Res>
    extends _$FacilitiesModelsCopyWithImpl<$Res>
    implements _$$_FacilitiesModelsCopyWith<$Res> {
  __$$_FacilitiesModelsCopyWithImpl(
      _$_FacilitiesModels _value, $Res Function(_$_FacilitiesModels) _then)
      : super(_value, (v) => _then(v as _$_FacilitiesModels));

  @override
  _$_FacilitiesModels get _value => super._value as _$_FacilitiesModels;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_FacilitiesModels(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilitiesModels implements _FacilitiesModels {
  _$_FacilitiesModels(
      {required this.id, required this.name, required this.image});

  factory _$_FacilitiesModels.fromJson(Map<String, dynamic> json) =>
      _$$_FacilitiesModelsFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'FacilitiesModels(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilitiesModels &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_FacilitiesModelsCopyWith<_$_FacilitiesModels> get copyWith =>
      __$$_FacilitiesModelsCopyWithImpl<_$_FacilitiesModels>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilitiesModelsToJson(
      this,
    );
  }
}

abstract class _FacilitiesModels implements FacilitiesModels {
  factory _FacilitiesModels(
      {required final int id,
      required final String name,
      required final String image}) = _$_FacilitiesModels;

  factory _FacilitiesModels.fromJson(Map<String, dynamic> json) =
      _$_FacilitiesModels.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_FacilitiesModelsCopyWith<_$_FacilitiesModels> get copyWith =>
      throw _privateConstructorUsedError;
}
