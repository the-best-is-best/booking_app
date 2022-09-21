import 'package:booking_app/features/explore/domain/hotels_model.dart';
import 'package:booking_app/features/explore/responses/hotels_response.dart';

extension ExtensionToDomain on HotelsResponse {
  HotelsModel toDomain() {
    return this.data;
  }
}
