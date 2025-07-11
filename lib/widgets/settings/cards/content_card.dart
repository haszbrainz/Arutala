import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final Widget content;

  const ContentCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x17000000),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: content,
      ),
    );
  }
}