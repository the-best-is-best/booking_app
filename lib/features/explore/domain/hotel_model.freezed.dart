// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hotel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) {
  return _HotelModel.fromJson(json);
}

/// @nodoc
mixin _$HotelModel {
  int get total => throw _privateConstructorUsedError;
  String get nextPageUrl => throw _privateConstructorUsedError;
  List<DataHotelModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotelModelCopyWith<HotelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelModelCopyWith<$Res> {
  factory $HotelModelCopyWith(
          HotelModel value, $Res Function(HotelModel) then) =
      _$HotelModelCopyWithImpl<$Res>;
  $Res call({int total, String nextPageUrl, List<DataHotelModel> data});
}

/// @nodoc
class _$HotelModelCopyWithImpl<$Res> implements $HotelModelCopyWith<$Res> {
  _$HotelModelCopyWithImpl(this._value, this._then);

  final HotelModel _value;
  // ignore: unused_field
  final $Res Function(HotelModel) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? nextPageUrl = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      nextPageUrl: nextPageUrl == freezed
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataHotelModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_HotelModelCopyWith<$Res>
    implements $HotelModelCopyWith<$Res> {
  factory _$$_HotelModelCopyWith(
          _$_HotelModel value, $Res Function(_$_HotelModel) then) =
      __$$_HotelModelCopyWithImpl<$Res>;
  @override
  $Res call({int total, String nextPageUrl, List<DataHotelModel> data});
}

/// @nodoc
class __$$_HotelModelCopyWithImpl<$Res> extends _$HotelModelCopyWithImpl<$Res>
    implements _$$_HotelModelCopyWith<$Res> {
  __$$_HotelModelCopyWithImpl(
      _$_HotelModel _value, $Res Function(_$_HotelModel) _then)
      : super(_value, (v) => _then(v as _$_HotelModel));

  @override
  _$_HotelModel get _value => super._value as _$_HotelModel;

  @override
  $Res call({
    Object? total = freezed,
    Object? nextPageUrl = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_HotelModel(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      nextPageUrl: nextPageUrl == freezed
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataHotelModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HotelModel implements _HotelModel {
  _$_HotelModel(
      {required this.total,
      required this.nextPageUrl,
      required final List<DataHotelModel> data})
      : _data = data;

  factory _$_HotelModel.fromJson(Map<String, dynamic> json) =>
      _$$_HotelModelFromJson(json);

  @override
  final int total;
  @override
  final String nextPageUrl;
  final List<DataHotelModel> _data;
  @override
  List<DataHotelModel> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'HotelModel(total: $total, nextPageUrl: $nextPageUrl, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HotelModel &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other.nextPageUrl, nextPageUrl) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(nextPageUrl),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_HotelModelCopyWith<_$_HotelModel> get copyWith =>
      __$$_HotelModelCopyWithImpl<_$_HotelModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HotelModelToJson(
      this,
    );
  }
}

abstract class _HotelModel implements HotelModel {
  factory _HotelModel(
      {required final int total,
      required final String nextPageUrl,
      required final List<DataHotelModel> data}) = _$_HotelModel;

  factory _HotelModel.fromJson(Map<String, dynamic> json) =
      _$_HotelModel.fromJson;

  @override
  int get total;
  @override
  String get nextPageUrl;
  @override
  List<DataHotelModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$_HotelModelCopyWith<_$_HotelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DataHotelModel _$DataHotelModelFromJson(Map<String, dynamic> json) {
  return _DataHotelModel.fromJson(json);
}

/// @nodoc
mixin _$DataHotelModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get rate => throw _privateConstructorUsedError;
  List<ImagesHotelModel> get images => throw _privateConstructorUsedError;
  List<HotelFacilitiesModel> get hotelFacilities =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataHotelModelCopyWith<DataHotelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataHotelModelCopyWith<$Res> {
  factory $DataHotelModelCopyWith(
          DataHotelModel value, $Res Function(DataHotelModel) then) =
      _$DataHotelModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String description,
      String price,
      String address,
      String longitude,
      String latitude,
      String rate,
      List<ImagesHotelModel> images,
      List<HotelFacilitiesModel> hotelFacilities});
}

/// @nodoc
class _$DataHotelModelCopyWithImpl<$Res>
    implements $DataHotelModelCopyWith<$Res> {
  _$DataHotelModelCopyWithImpl(this._value, this._then);

  final DataHotelModel _value;
  // ignore: unused_field
  final $Res Function(DataHotelModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? address = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? rate = freezed,
    Object? images = freezed,
    Object? hotelFacilities = freezed,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesHotelModel>,
      hotelFacilities: hotelFacilities == freezed
          ? _value.hotelFacilities
          : hotelFacilities // ignore: cast_nullable_to_non_nullable
              as List<HotelFacilitiesModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_DataHotelModelCopyWith<$Res>
    implements $DataHotelModelCopyWith<$Res> {
  factory _$$_DataHotelModelCopyWith(
          _$_DataHotelModel value, $Res Function(_$_DataHotelModel) then) =
      __$$_DataHotelModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String description,
      String price,
      String address,
      String longitude,
      String latitude,
      String rate,
      List<ImagesHotelModel> images,
      List<HotelFacilitiesModel> hotelFacilities});
}

/// @nodoc
class __$$_DataHotelModelCopyWithImpl<$Res>
    extends _$DataHotelModelCopyWithImpl<$Res>
    implements _$$_DataHotelModelCopyWith<$Res> {
  __$$_DataHotelModelCopyWithImpl(
      _$_DataHotelModel _value, $Res Function(_$_DataHotelModel) _then)
      : super(_value, (v) => _then(v as _$_DataHotelModel));

  @override
  _$_DataHotelModel get _value => super._value as _$_DataHotelModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? address = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? rate = freezed,
    Object? images = freezed,
    Object? hotelFacilities = freezed,
  }) {
    return _then(_$_DataHotelModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesHotelModel>,
      hotelFacilities: hotelFacilities == freezed
          ? _value._hotelFacilities
          : hotelFacilities // ignore: cast_nullable_to_non_nullable
              as List<HotelFacilitiesModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataHotelModel implements _DataHotelModel {
  _$_DataHotelModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.address,
      required this.longitude,
      required this.latitude,
      required this.rate,
      required final List<ImagesHotelModel> images,
      required final List<HotelFacilitiesModel> hotelFacilities})
      : _images = images,
        _hotelFacilities = hotelFacilities;

  factory _$_DataHotelModel.fromJson(Map<String, dynamic> json) =>
      _$$_DataHotelModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String price;
  @override
  final String address;
  @override
  final String longitude;
  @override
  final String latitude;
  @override
  final String rate;
  final List<ImagesHotelModel> _images;
  @override
  List<ImagesHotelModel> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<HotelFacilitiesModel> _hotelFacilities;
  @override
  List<HotelFacilitiesModel> get hotelFacilities {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotelFacilities);
  }

  @override
  String toString() {
    return 'DataHotelModel(id: $id, name: $name, description: $description, price: $price, address: $address, longitude: $longitude, latitude: $latitude, rate: $rate, images: $images, hotelFacilities: $hotelFacilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataHotelModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._hotelFacilities, _hotelFacilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_hotelFacilities));

  @JsonKey(ignore: true)
  @override
  _$$_DataHotelModelCopyWith<_$_DataHotelModel> get copyWith =>
      __$$_DataHotelModelCopyWithImpl<_$_DataHotelModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataHotelModelToJson(
      this,
    );
  }
}

abstract class _DataHotelModel implements DataHotelModel {
  factory _DataHotelModel(
          {required final int id,
          required final String name,
          required final String description,
          required final String price,
          required final String address,
          required final String longitude,
          required final String latitude,
          required final String rate,
          required final List<ImagesHotelModel> images,
          required final List<HotelFacilitiesModel> hotelFacilities}) =
      _$_DataHotelModel;

  factory _DataHotelModel.fromJson(Map<String, dynamic> json) =
      _$_DataHotelModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get price;
  @override
  String get address;
  @override
  String get longitude;
  @override
  String get latitude;
  @override
  String get rate;
  @override
  List<ImagesHotelModel> get images;
  @override
  List<HotelFacilitiesModel> get hotelFacilities;
  @override
  @JsonKey(ignore: true)
  _$$_DataHotelModelCopyWith<_$_DataHotelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ImagesHotelModel _$ImagesHotelModelFromJson(Map<String, dynamic> json) {
  return _ImagesHotelModel.fromJson(json);
}

/// @nodoc
mixin _$ImagesHotelModel {
  int get id => throw _privateConstructorUsedError;
  String get hotelId => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesHotelModelCopyWith<ImagesHotelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesHotelModelCopyWith<$Res> {
  factory $ImagesHotelModelCopyWith(
          ImagesHotelModel value, $Res Function(ImagesHotelModel) then) =
      _$ImagesHotelModelCopyWithImpl<$Res>;
  $Res call({int id, String hotelId, String image});
}

/// @nodoc
class _$ImagesHotelModelCopyWithImpl<$Res>
    implements $ImagesHotelModelCopyWith<$Res> {
  _$ImagesHotelModelCopyWithImpl(this._value, this._then);

  final ImagesHotelModel _value;
  // ignore: unused_field
  final $Res Function(ImagesHotelModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? hotelId = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hotelId: hotelId == freezed
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ImagesHotelModelCopyWith<$Res>
    implements $ImagesHotelModelCopyWith<$Res> {
  factory _$$_ImagesHotelModelCopyWith(
          _$_ImagesHotelModel value, $Res Function(_$_ImagesHotelModel) then) =
      __$$_ImagesHotelModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String hotelId, String image});
}

/// @nodoc
class __$$_ImagesHotelModelCopyWithImpl<$Res>
    extends _$ImagesHotelModelCopyWithImpl<$Res>
    implements _$$_ImagesHotelModelCopyWith<$Res> {
  __$$_ImagesHotelModelCopyWithImpl(
      _$_ImagesHotelModel _value, $Res Function(_$_ImagesHotelModel) _then)
      : super(_value, (v) => _then(v as _$_ImagesHotelModel));

  @override
  _$_ImagesHotelModel get _value => super._value as _$_ImagesHotelModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? hotelId = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_ImagesHotelModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hotelId: hotelId == freezed
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
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
class _$_ImagesHotelModel implements _ImagesHotelModel {
  _$_ImagesHotelModel(
      {required this.id, required this.hotelId, required this.image});

  factory _$_ImagesHotelModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesHotelModelFromJson(json);

  @override
  final int id;
  @override
  final String hotelId;
  @override
  final String image;

  @override
  String toString() {
    return 'ImagesHotelModel(id: $id, hotelId: $hotelId, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesHotelModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.hotelId, hotelId) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(hotelId),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_ImagesHotelModelCopyWith<_$_ImagesHotelModel> get copyWith =>
      __$$_ImagesHotelModelCopyWithImpl<_$_ImagesHotelModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImagesHotelModelToJson(
      this,
    );
  }
}

abstract class _ImagesHotelModel implements ImagesHotelModel {
  factory _ImagesHotelModel(
      {required final int id,
      required final String hotelId,
      required final String image}) = _$_ImagesHotelModel;

  factory _ImagesHotelModel.fromJson(Map<String, dynamic> json) =
      _$_ImagesHotelModel.fromJson;

  @override
  int get id;
  @override
  String get hotelId;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_ImagesHotelModelCopyWith<_$_ImagesHotelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

HotelFacilitiesModel _$HotelFacilitiesModelFromJson(Map<String, dynamic> json) {
  return _HotelFacilitiesModel.fromJson(json);
}

/// @nodoc
mixin _$HotelFacilitiesModel {
  int get id => throw _privateConstructorUsedError;
  String get hotelId => throw _privateConstructorUsedError;
  String get facilityId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotelFacilitiesModelCopyWith<HotelFacilitiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelFacilitiesModelCopyWith<$Res> {
  factory $HotelFacilitiesModelCopyWith(HotelFacilitiesModel value,
          $Res Function(HotelFacilitiesModel) then) =
      _$HotelFacilitiesModelCopyWithImpl<$Res>;
  $Res call({int id, String hotelId, String facilityId});
}

/// @nodoc
class _$HotelFacilitiesModelCopyWithImpl<$Res>
    implements $HotelFacilitiesModelCopyWith<$Res> {
  _$HotelFacilitiesModelCopyWithImpl(this._value, this._then);

  final HotelFacilitiesModel _value;
  // ignore: unused_field
  final $Res Function(HotelFacilitiesModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? hotelId = freezed,
    Object? facilityId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hotelId: hotelId == freezed
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
              as String,
      facilityId: facilityId == freezed
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_HotelFacilitiesModelCopyWith<$Res>
    implements $HotelFacilitiesModelCopyWith<$Res> {
  factory _$$_HotelFacilitiesModelCopyWith(_$_HotelFacilitiesModel value,
          $Res Function(_$_HotelFacilitiesModel) then) =
      __$$_HotelFacilitiesModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String hotelId, String facilityId});
}

/// @nodoc
class __$$_HotelFacilitiesModelCopyWithImpl<$Res>
    extends _$HotelFacilitiesModelCopyWithImpl<$Res>
    implements _$$_HotelFacilitiesModelCopyWith<$Res> {
  __$$_HotelFacilitiesModelCopyWithImpl(_$_HotelFacilitiesModel _value,
      $Res Function(_$_HotelFacilitiesModel) _then)
      : super(_value, (v) => _then(v as _$_HotelFacilitiesModel));

  @override
  _$_HotelFacilitiesModel get _value => super._value as _$_HotelFacilitiesModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? hotelId = freezed,
    Object? facilityId = freezed,
  }) {
    return _then(_$_HotelFacilitiesModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hotelId: hotelId == freezed
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
              as String,
      facilityId: facilityId == freezed
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HotelFacilitiesModel implements _HotelFacilitiesModel {
  _$_HotelFacilitiesModel(
      {required this.id, required this.hotelId, required this.facilityId});

  factory _$_HotelFacilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$$_HotelFacilitiesModelFromJson(json);

  @override
  final int id;
  @override
  final String hotelId;
  @override
  final String facilityId;

  @override
  String toString() {
    return 'HotelFacilitiesModel(id: $id, hotelId: $hotelId, facilityId: $facilityId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HotelFacilitiesModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.hotelId, hotelId) &&
            const DeepCollectionEquality()
                .equals(other.facilityId, facilityId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(hotelId),
      const DeepCollectionEquality().hash(facilityId));

  @JsonKey(ignore: true)
  @override
  _$$_HotelFacilitiesModelCopyWith<_$_HotelFacilitiesModel> get copyWith =>
      __$$_HotelFacilitiesModelCopyWithImpl<_$_HotelFacilitiesModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HotelFacilitiesModelToJson(
      this,
    );
  }
}

abstract class _HotelFacilitiesModel implements HotelFacilitiesModel {
  factory _HotelFacilitiesModel(
      {required final int id,
      required final String hotelId,
      required final String facilityId}) = _$_HotelFacilitiesModel;

  factory _HotelFacilitiesModel.fromJson(Map<String, dynamic> json) =
      _$_HotelFacilitiesModel.fromJson;

  @override
  int get id;
  @override
  String get hotelId;
  @override
  String get facilityId;
  @override
  @JsonKey(ignore: true)
  _$$_HotelFacilitiesModelCopyWith<_$_HotelFacilitiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
