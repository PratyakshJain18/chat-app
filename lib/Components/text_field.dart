import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  final String hintText;
  final bool hidden;
  final TextEditingController textController;
  const MyTextField({super.key, required this.hintText, required this.hidden, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
         obscureText: hidden,
        controller: textController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:BorderSide(
              color: Theme.of(context).colorScheme.primary
            )
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)
        ),
    ),
    );
  }
}
