
import 'package:flutter/cupertino.dart';

class Video{

  final String name;
  final String key;
  final String publishedAt;
  final String id;

  Video({
    required this.name,
    required this.id,
    required this.key,
    required this.publishedAt,
});
  factory Video.fromJson(Map<String,dynamic> json){
    return Video(
        name: json['name'],
        id: json['id'],
        key: json['key'],
        publishedAt: json['published_at'],
    );
  }
}