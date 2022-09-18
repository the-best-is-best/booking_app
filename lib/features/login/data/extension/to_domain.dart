import 'package:booking_app/app/extensions.dart';
import 'package:booking_app/features/login/data/responses/login_response.dart';
import 'package:booking_app/features/login/domain/user_model.dart';

extension ExtensionToDomain on LoginResponse? {
  UserModel toDomain() {
    return UserModel(
        name: this?.data?.name.orEmpty() ?? "",
        email: this?.data?.email.orEmpty() ?? "",
        apiToken: this?.data?.apiToken.orEmpty() ?? "",
        id: this?.data?.id.orEmpty() ?? 0,
        image: this?.data?.image.orEmpty() ?? "");
  }
}
