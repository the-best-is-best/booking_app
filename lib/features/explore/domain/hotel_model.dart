import 'dart:convert';

class HotelModel {
  final int total;
  String nextPageUrl;
  final List<DataHotelModel> data;

  HotelModel(
      {required this.total, required this.nextPageUrl, required this.data});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'total': total});
    result.addAll({'nextPageUrl': nextPageUrl});
    result.addAll({'data': data.map((x) => x.toMap()).toList()});

    return result;
  }

  factory HotelModel.fromMap(Map<String, dynamic> map) {
    return HotelModel(
      total: map['total']?.toInt() ?? 0,
      nextPageUrl: map['nextPageUrl'] ?? '',
      data: List<DataHotelModel>.from(
          map['data']?.map((x) => DataHotelModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelModel.fromJson(String source) =>
      HotelModel.fromMap(json.decode(source));

  HotelModel copyWith({
    int? id,
    int? total,
    String? nextPageUrl,
    List<DataHotelModel>? data,
  }) {
    return HotelModel(
      total: total ?? this.total,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      data: data ?? this.data,
    );
  }
}

class DataHotelModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final String longitude;
  final String latitude;
  final String rate;
  final List<ImagesHotelModel> images;
  final List<HotelFacilitiesModel> hotelFacilities;

  DataHotelModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.address,
      required this.longitude,
      required this.latitude,
      required this.rate,
      required this.images,
      required this.hotelFacilities});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'address': address});
    result.addAll({'longitude': longitude});
    result.addAll({'latitude': latitude});
    result.addAll({'rate': rate});
    result.addAll({'images': images.map((x) => x.toMap()).toList()});
    result.addAll(
        {'hotelFacilities': hotelFacilities.map((x) => x.toMap()).toList()});

    return result;
  }

  factory DataHotelModel.fromMap(Map<String, dynamic> map) {
    return DataHotelModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      address: map['address'] ?? '',
      longitude: map['longitude'] ?? '',
      latitude: map['latitude'] ?? '',
      rate: map['rate'] ?? '',
      images: List<ImagesHotelModel>.from(
          map['images']?.map((x) => ImagesHotelModel.fromMap(x))),
      hotelFacilities: List<HotelFacilitiesModel>.from(
          map['hotelFacilities']?.map((x) => HotelFacilitiesModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataHotelModel.fromJson(String source) =>
      DataHotelModel.fromMap(json.decode(source));
}

class ImagesHotelModel {
  final int id;
  final String hotelId;
  final String image;

  ImagesHotelModel(
      {required this.id, required this.hotelId, required this.image});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'hotelId': hotelId});
    result.addAll({'image': image});

    return result;
  }

  factory ImagesHotelModel.fromMap(Map<String, dynamic> map) {
    return ImagesHotelModel(
      id: map['id']?.toInt() ?? 0,
      hotelId: map['hotelId'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImagesHotelModel.fromJson(String source) =>
      ImagesHotelModel.fromMap(json.decode(source));
}

class HotelFacilitiesModel {
  final int id;
  final String hotelId;
  final String facilityId;

  HotelFacilitiesModel(
      {required this.id, required this.hotelId, required this.facilityId});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'hotelId': hotelId});
    result.addAll({'facilityId': facilityId});

    return result;
  }

  factory HotelFacilitiesModel.fromMap(Map<String, dynamic> map) {
    return HotelFacilitiesModel(
      id: map['id']?.toInt() ?? 0,
      hotelId: map['hotelId'] ?? '',
      facilityId: map['facilityId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelFacilitiesModel.fromJson(String source) =>
      HotelFacilitiesModel.fromMap(json.decode(source));
}
