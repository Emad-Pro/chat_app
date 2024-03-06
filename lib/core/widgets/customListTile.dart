import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoDirection(text: title, child: Text(title)),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
