import 'package:booking_app/app/extensions.dart';
import 'package:booking_app/features/auth/domain/user_model.dart';
import 'package:booking_app/features/auth/update_profile/responses/response_update_profile.dart';

extension ExtensionToDomain on UpdateProfileResponse? {
  UserModel toDomain() {
    return UserModel(
        id: this?.data?.id.orEmpty() ?? 0,
        name: this?.data?.name.orEmpty() ?? "",
        email: this?.data?.email.orEmpty() ?? "",
        apiToken: this?.data?.apiToken.orEmpty() ?? "",
        image: this?.data?.image.orEmpty() ?? "");
  }
}
