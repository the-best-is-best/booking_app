import 'package:mit_x/mit_x.dart';

void mySnackBar(String message) {
  MitX.showSnackbar(MitXSnackBar(
    duration: const Duration(seconds: 2),
    title: "Alert",
    message: message,
  ));
}
