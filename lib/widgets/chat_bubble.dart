import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final Alignment alignment;
  final ChatMessageEntity entity;

  ChatBubble({super.key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.authorName == context.read<AuthService>().getUsername();

    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            //image: DecorationImage(image: NetworkImage(entity.imageUrl!)),
            color: isAuthor ? Colors.black : Colors.deepPurpleAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${entity.text}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            if (entity.imageUrl != null)
              Image.network(
                '${entity.imageUrl}',
                height: 160,
                width: MediaQuery.of(context).size.width,
              )
          ],
        ),
      ),
    );
  }
}
