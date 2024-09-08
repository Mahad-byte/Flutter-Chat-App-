import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatInput extends StatefulWidget {
  ChatInput({super.key, required this.onSubmit});
  final Function(ChatMessageEntity) onSubmit;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final chatMessageController = TextEditingController();

  void onSendButton() async {
    String? userNameFromCache = await context.read<AuthService>().getUsername();
    final newChatMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: "22",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(authorName: userNameFromCache!));

    chatMessageController.clear();
    FocusScope.of(context).unfocus();
    widget.onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Text("Your images will display here!");
                            }),
                      );
                    });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            textCapitalization: TextCapitalization.sentences,
            controller: chatMessageController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.grey)),
          )),
          IconButton(
              onPressed: onSendButton,
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
