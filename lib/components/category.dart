import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({super.key,  this.text , this.color ,this.onTap});
  String? text;
  Color? color;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 24),
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 65,
        color: color!,
        child: Text(text!,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
      ),
    );
  }
}

