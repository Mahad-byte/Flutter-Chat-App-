import 'dart:convert';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  _loadInitailMessages() async {
    /**
     * await blocks the execution and waits foe the async call to complete,
     * final response = await rootBundle.loadString("assets/mock_messages.json");
     * .then() does not waits for the async call to finish and moves on to the next line of code.
     **/
    rootBundle.loadString("assets/mock_messages.json").then((response) {
      final List<dynamic> decodedList = jsonDecode(response) as List;
      final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      setState(() {
        _message = _chatMessages;
      });
      print("This will print");
    });
  }

  onSendMessage(ChatMessageEntity entity) {
    _message.add(entity);
    setState(() {});
  }
  // _getNetworkImage() async {
  //   var endpoint = Uri.parse("https://pixelford.com/api2/images");
  //   final response = await http.get(endpoint);
  //   final List<dynamic> decodedList = jsonDecode(response.body) as List;
  //   final List<PixelFormImage> _image = decodedList.map((listItem){
  //     return PixelFormImage;
  //   }).toList();
  // }

  List<ChatMessageEntity> _message = [];

  @override
  void initState() {
    _loadInitailMessages();
    //_getNetworkImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = context.read<AuthService>().getUsername();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(username!),
        actions: [
          IconButton(
              onPressed: () {
                //Navigator.maybePop(context);
                //Navigator.pushNamed(context, '/');
                context.read<AuthService>().logoutUser();
                Navigator.popAndPushNamed(context, '/');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _message.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: _message[index].author.authorName ==
                                context.read<AuthService>().getUsername()
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        entity: _message[index]);
                  })),
          ChatInput(onSubmit: onSendMessage),
        ],
      ),
    );
  }
}
