import 'package:flutter/material.dart';
class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 2,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),

            ),
            height: 70,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 10,),
                Text(text , style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          SizedBox(height: 2,)
        ],
      ),
    );
  }
}
