import 'package:flutter/material.dart';



class InputFieldLabel extends StatelessWidget {

  final String title;
  // ignore: use_key_in_widget_constructors
  const InputFieldLabel(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title,style: Theme.of(context).textTheme.titleMedium,);
  }

}