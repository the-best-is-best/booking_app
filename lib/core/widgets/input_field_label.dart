import 'package:flutter/material.dart';

class InputFieldLabel extends StatelessWidget {
  final String title;
  final TextStyle? style;

  // ignore: use_key_in_widget_constructors
  const InputFieldLabel(this.title, {this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? Theme.of(context).textTheme.titleMedium,
    );
  }
}
