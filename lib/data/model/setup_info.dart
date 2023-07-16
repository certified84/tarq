import 'package:flutter/material.dart';

class SetupInfo {
  String title;
  String description;
  Color color;
  String icon;
  String which;
  bool isCompleted;

  SetupInfo(this.title, this.description, this.color, this.icon, this.which,
      {this.isCompleted = false});

  factory SetupInfo.fromMap(Map map) {
    SetupInfo item = SetupInfo(
      map['title'],
      map['description'],
      map['color'],
      map['icon'],
      map['which'],
      isCompleted: map['isCompleted'],
    );
    return item;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'color': color,
      'icon': icon,
      'which': which,
      'isCompleted': isCompleted,
    };
  }
}
