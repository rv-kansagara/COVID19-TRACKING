import 'dart:ui';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'neumorphic_container.dart';

class GlobalCard extends StatelessWidget {
  final String icon;
  final double cases;
  final String label;
  final Color? color;

  GlobalCard({
    required this.icon,
    required this.cases,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(icon, fit: BoxFit.contain, height: 65),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              NumberFormat.compact().format(cases).toString(),
              style: TextStyle(
                fontSize: 19,
                color: color,
                letterSpacing: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
