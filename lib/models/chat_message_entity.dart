import 'package:chat_app/models/chat_message_entity.dart';

class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity(
      {required this.text,
      this.imageUrl,
      required this.id,
      required this.createdAt,
      required this.author});

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
        text: json['text'],
        imageUrl: json['image'],
        id: json['id'],
        createdAt: json['createdAt'],
        author: Author.fromJson(json['author']));
  }
}

class Author {
  String authorName;

  Author({required this.authorName});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(authorName: json['username']);
  }
}
