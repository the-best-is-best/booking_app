// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trips_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripsModel _$TripsModelFromJson(Map<String, dynamic> json) {
  return _TripsModel.fromJson(json);
}

/// @nodoc
mixin _$TripsModel {
  String get nextPageUrl => throw _privateConstructorUsedError;
  List<DataModelTrips> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripsModelCopyWith<TripsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripsModelCopyWith<$Res> {
  factory $TripsModelCopyWith(
          TripsModel value, $Res Function(TripsModel) then) =
      _$TripsModelCopyWithImpl<$Res>;
  $Res call({String nextPageUrl, List<DataModelTrips> data});
}

/// @nodoc
class _$TripsModelCopyWithImpl<$Res> implements $TripsModelCopyWith<$Res> {
  _$TripsModelCopyWithImpl(this._value, this._then);

  final TripsModel _value;
  // ignore: unused_field
  final $Res Function(TripsModel) _then;

  @override
  $Res call({
    Object? nextPageUrl = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      nextPageUrl: nextPageUrl == freezed
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataModelTrips>,
    ));
  }
}

/// @nodoc
abstract class _$$_TripsModelCopyWith<$Res>
    implements $TripsModelCopyWith<$Res> {
  factory _$$_TripsModelCopyWith(
          _$_TripsModel value, $Res Function(_$_TripsModel) then) =
      __$$_TripsModelCopyWithImpl<$Res>;
  @override
  $Res call({String nextPageUrl, List<DataModelTrips> data});
}

/// @nodoc
class __$$_TripsModelCopyWithImpl<$Res> extends _$TripsModelCopyWithImpl<$Res>
    implements _$$_TripsModelCopyWith<$Res> {
  __$$_TripsModelCopyWithImpl(
      _$_TripsModel _value, $Res Function(_$_TripsModel) _then)
      : super(_value, (v) => _then(v as _$_TripsModel));

  @override
  _$_TripsModel get _value => super._value as _$_TripsModel;

  @override
  $Res call({
    Object? nextPageUrl = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_TripsModel(
      nextPageUrl: nextPageUrl == freezed
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataModelTrips>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripsModel implements _TripsModel {
  _$_TripsModel(
      {required this.nextPageUrl, required final List<DataModelTrips> data})
      : _data = data;

  factory _$_TripsModel.fromJson(Map<String, dynamic> json) =>
      _$$_TripsModelFromJson(json);

  @override
  final String nextPageUrl;
  final List<DataModelTrips> _data;
  @override
  List<DataModelTrips> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TripsModel(nextPageUrl: $nextPageUrl, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripsModel &&
            const DeepCollectionEquality()
                .equals(other.nextPageUrl, nextPageUrl) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nextPageUrl),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_TripsModelCopyWith<_$_TripsModel> get copyWith =>
      __$$_TripsModelCopyWithImpl<_$_TripsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripsModelToJson(
      this,
    );
  }
}

abstract class _TripsModel implements TripsModel {
  factory _TripsModel(
      {required final String nextPageUrl,
      required final List<DataModelTrips> data}) = _$_TripsModel;

  factory _TripsModel.fromJson(Map<String, dynamic> json) =
      _$_TripsModel.fromJson;

  @override
  String get nextPageUrl;
  @override
  List<DataModelTrips> get data;
  @override
  @JsonKey(ignore: true)
  _$$_TripsModelCopyWith<_$_TripsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DataModelTrips _$DataModelTripsFromJson(Map<String, dynamic> json) {
  return _DataModelTrips.fromJson(json);
}

/// @nodoc
mixin _$DataModelTrips {
  DataHotelTripsModel get dataHotel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataModelTripsCopyWith<DataModelTrips> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataModelTripsCopyWith<$Res> {
  factory $DataModelTripsCopyWith(
          DataModelTrips value, $Res Function(DataModelTrips) then) =
      _$DataModelTripsCopyWithImpl<$Res>;
  $Res call({DataHotelTripsModel dataHotel});

  $DataHotelTripsModelCopyWith<$Res> get dataHotel;
}

/// @nodoc
class _$DataModelTripsCopyWithImpl<$Res>
    implements $DataModelTripsCopyWith<$Res> {
  _$DataModelTripsCopyWithImpl(this._value, this._then);

  final DataModelTrips _value;
  // ignore: unused_field
  final $Res Function(DataModelTrips) _then;

  @override
  $Res call({
    Object? dataHotel = freezed,
  }) {
    return _then(_value.copyWith(
      dataHotel: dataHotel == freezed
          ? _value.dataHotel
          : dataHotel // ignore: cast_nullable_to_non_nullable
              as DataHotelTripsModel,
    ));
  }

  @override
  $DataHotelTripsModelCopyWith<$Res> get dataHotel {
    return $DataHotelTripsModelCopyWith<$Res>(_value.dataHotel, (value) {
      return _then(_value.copyWith(dataHotel: value));
    });
  }
}

/// @nodoc
abstract class _$$_DataModelTripsCopyWith<$Res>
    implements $DataModelTripsCopyWith<$Res> {
  factory _$$_DataModelTripsCopyWith(
          _$_DataModelTrips value, $Res Function(_$_DataModelTrips) then) =
      __$$_DataModelTripsCopyWithImpl<$Res>;
  @override
  $Res call({DataHotelTripsModel dataHotel});

  @override
  $DataHotelTripsModelCopyWith<$Res> get dataHotel;
}

/// @nodoc
class __$$_DataModelTripsCopyWithImpl<$Res>
    extends _$DataModelTripsCopyWithImpl<$Res>
    implements _$$_DataModelTripsCopyWith<$Res> {
  __$$_DataModelTripsCopyWithImpl(
      _$_DataModelTrips _value, $Res Function(_$_DataModelTrips) _then)
      : super(_value, (v) => _then(v as _$_DataModelTrips));

  @override
  _$_DataModelTrips get _value => super._value as _$_DataModelTrips;

  @override
  $Res call({
    Object? dataHotel = freezed,
  }) {
    return _then(_$_DataModelTrips(
      dataHotel: dataHotel == freezed
          ? _value.dataHotel
          : dataHotel // ignore: cast_nullable_to_non_nullable
              as DataHotelTripsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataModelTrips implements _DataModelTrips {
  _$_DataModelTrips({required this.dataHotel});

  factory _$_DataModelTrips.fromJson(Map<String, dynamic> json) =>
      _$$_DataModelTripsFromJson(json);

  @override
  final DataHotelTripsModel dataHotel;

  @override
  String toString() {
    return 'DataModelTrips(dataHotel: $dataHotel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataModelTrips &&
            const DeepCollectionEquality().equals(other.dataHotel, dataHotel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(dataHotel));

  @JsonKey(ignore: true)
  @override
  _$$_DataModelTripsCopyWith<_$_DataModelTrips> get copyWith =>
      __$$_DataModelTripsCopyWithImpl<_$_DataModelTrips>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataModelTripsToJson(
      this,
    );
  }
}

abstract class _DataModelTrips implements DataModelTrips {
  factory _DataModelTrips({required final DataHotelTripsModel dataHotel}) =
      _$_DataModelTrips;

  factory _DataModelTrips.fromJson(Map<String, dynamic> json) =
      _$_DataModelTrips.fromJson;

  @override
  DataHotelTripsModel get dataHotel;
  @override
  @JsonKey(ignore: true)
  _$$_DataModelTripsCopyWith<_$_DataModelTrips> get copyWith =>
      throw _privateConstructorUsedError;
}

DataHotelTripsModel _$DataHotelTripsModelFromJson(Map<String, dynamic> json) {
  return _DataHotelTripsModel.fromJson(json);
}

/// @nodoc
mixin _$DataHotelTripsModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get rate => throw _privateConstructorUsedError;
  List<ImagesHotelTripsModel> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataHotelTripsModelCopyWith<DataHotelTripsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataHotelTripsModelCopyWith<$Res> {
  factory $DataHotelTripsModelCopyWith(
          DataHotelTripsModel value, $Res Function(DataHotelTripsModel) then) =
      _$DataHotelTripsModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String price,
      String address,
      String rate,
      List<ImagesHotelTripsModel> images});
}

/// @nodoc
class _$DataHotelTripsModelCopyWithImpl<$Res>
    implements $DataHotelTripsModelCopyWith<$Res> {
  _$DataHotelTripsModelCopyWithImpl(this._value, this._then);

  final DataHotelTripsModel _value;
  // ignore: unused_field
  final $Res Function(DataHotelTripsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? address = freezed,
    Object? rate = freezed,
    Object? images = freezed,
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
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesHotelTripsModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_DataHotelTripsModelCopyWith<$Res>
    implements $DataHotelTripsModelCopyWith<$Res> {
  factory _$$_DataHotelTripsModelCopyWith(_$_DataHotelTripsModel value,
          $Res Function(_$_DataHotelTripsModel) then) =
      __$$_DataHotelTripsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String price,
      String address,
      String rate,
      List<ImagesHotelTripsModel> images});
}

/// @nodoc
class __$$_DataHotelTripsModelCopyWithImpl<$Res>
    extends _$DataHotelTripsModelCopyWithImpl<$Res>
    implements _$$_DataHotelTripsModelCopyWith<$Res> {
  __$$_DataHotelTripsModelCopyWithImpl(_$_DataHotelTripsModel _value,
      $Res Function(_$_DataHotelTripsModel) _then)
      : super(_value, (v) => _then(v as _$_DataHotelTripsModel));

  @override
  _$_DataHotelTripsModel get _value => super._value as _$_DataHotelTripsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? address = freezed,
    Object? rate = freezed,
    Object? images = freezed,
  }) {
    return _then(_$_DataHotelTripsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesHotelTripsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataHotelTripsModel implements _DataHotelTripsModel {
  _$_DataHotelTripsModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.address,
      required this.rate,
      required final List<ImagesHotelTripsModel> images})
      : _images = images;

  factory _$_DataHotelTripsModel.fromJson(Map<String, dynamic> json) =>
      _$$_DataHotelTripsModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String price;
  @override
  final String address;
  @override
  final String rate;
  final List<ImagesHotelTripsModel> _images;
  @override
  List<ImagesHotelTripsModel> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'DataHotelTripsModel(id: $id, name: $name, price: $price, address: $address, rate: $rate, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataHotelTripsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  _$$_DataHotelTripsModelCopyWith<_$_DataHotelTripsModel> get copyWith =>
      __$$_DataHotelTripsModelCopyWithImpl<_$_DataHotelTripsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataHotelTripsModelToJson(
      this,
    );
  }
}

abstract class _DataHotelTripsModel implements DataHotelTripsModel {
  factory _DataHotelTripsModel(
          {required final int id,
          required final String name,
          required final String price,
          required final String address,
          required final String rate,
          required final List<ImagesHotelTripsModel> images}) =
      _$_DataHotelTripsModel;

  factory _DataHotelTripsModel.fromJson(Map<String, dynamic> json) =
      _$_DataHotelTripsModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get price;
  @override
  String get address;
  @override
  String get rate;
  @override
  List<ImagesHotelTripsModel> get images;
  @override
  @JsonKey(ignore: true)
  _$$_DataHotelTripsModelCopyWith<_$_DataHotelTripsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ImagesHotelTripsModel _$ImagesHotelTripsModelFromJson(
    Map<String, dynamic> json) {
  return _ImagesHotelTripsModel.fromJson(json);
}

/// @nodoc
mixin _$ImagesHotelTripsModel {
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesHotelTripsModelCopyWith<ImagesHotelTripsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesHotelTripsModelCopyWith<$Res> {
  factory $ImagesHotelTripsModelCopyWith(ImagesHotelTripsModel value,
          $Res Function(ImagesHotelTripsModel) then) =
      _$ImagesHotelTripsModelCopyWithImpl<$Res>;
  $Res call({String image});
}

/// @nodoc
class _$ImagesHotelTripsModelCopyWithImpl<$Res>
    implements $ImagesHotelTripsModelCopyWith<$Res> {
  _$ImagesHotelTripsModelCopyWithImpl(this._value, this._then);

  final ImagesHotelTripsModel _value;
  // ignore: unused_field
  final $Res Function(ImagesHotelTripsModel) _then;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ImagesHotelTripsModelCopyWith<$Res>
    implements $ImagesHotelTripsModelCopyWith<$Res> {
  factory _$$_ImagesHotelTripsModelCopyWith(_$_ImagesHotelTripsModel value,
          $Res Function(_$_ImagesHotelTripsModel) then) =
      __$$_ImagesHotelTripsModelCopyWithImpl<$Res>;
  @override
  $Res call({String image});
}

/// @nodoc
class __$$_ImagesHotelTripsModelCopyWithImpl<$Res>
    extends _$ImagesHotelTripsModelCopyWithImpl<$Res>
    implements _$$_ImagesHotelTripsModelCopyWith<$Res> {
  __$$_ImagesHotelTripsModelCopyWithImpl(_$_ImagesHotelTripsModel _value,
      $Res Function(_$_ImagesHotelTripsModel) _then)
      : super(_value, (v) => _then(v as _$_ImagesHotelTripsModel));

  @override
  _$_ImagesHotelTripsModel get _value =>
      super._value as _$_ImagesHotelTripsModel;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_$_ImagesHotelTripsModel(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImagesHotelTripsModel implements _ImagesHotelTripsModel {
  _$_ImagesHotelTripsModel({required this.image});

  factory _$_ImagesHotelTripsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesHotelTripsModelFromJson(json);

  @override
  final String image;

  @override
  String toString() {
    return 'ImagesHotelTripsModel(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesHotelTripsModel &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_ImagesHotelTripsModelCopyWith<_$_ImagesHotelTripsModel> get copyWith =>
      __$$_ImagesHotelTripsModelCopyWithImpl<_$_ImagesHotelTripsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImagesHotelTripsModelToJson(
      this,
    );
  }
}

abstract class _ImagesHotelTripsModel implements ImagesHotelTripsModel {
  factory _ImagesHotelTripsModel({required final String image}) =
      _$_ImagesHotelTripsModel;

  factory _ImagesHotelTripsModel.fromJson(Map<String, dynamic> json) =
      _$_ImagesHotelTripsModel.fromJson;

  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_ImagesHotelTripsModelCopyWith<_$_ImagesHotelTripsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
