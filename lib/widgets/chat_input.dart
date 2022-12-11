// ignore_for_file: prefer_const_constructors

import 'package:chat_app/modal/chat_massage_entity.dart';
import 'package:chat_app/widgets/picker_body.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMassageEntity) onsubmit;

  ChatInput({Key? key, required this.onsubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImageurl = '';

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print('ChatMessage: ${chatMessageController.text}');
    final newChatInput = ChatMassageEntity(
        text: chatMessageController.text,
        id: "224",
        author: Author(userName: "Abhishek"));
    if (_selectedImageurl.isNotEmpty) {
      newChatInput.imageUrl = _selectedImageurl;
    }

    widget.onsubmit(newChatInput);
    chatMessageController.clear();
    _selectedImageurl = '';
    setState(() {});
  }

  void onImagePiked(String newImageUrl) {
    setState(() {
      _selectedImageurl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      // ignore: sort_child_properties_last
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Add the  addition icon at the left of chat page...
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NetworkImagePickerBody(
                      onImageSelecter: onImagePiked,
                    );
                  });
            },
            icon: Icon(Icons.add),
            color: Colors.white,
          ),

          // Add the input area in chat page...
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                maxLines: 5,
                minLines: 1,
                textCapitalization: TextCapitalization.sentences,
                controller: chatMessageController,
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type here message...',
                    hintStyle: TextStyle(color: Colors.blueGrey)),
              ),
              if (_selectedImageurl.isNotEmpty)
                Image.network(
                  _selectedImageurl,
                  height: 50,
                ),
            ],
          )),

          // Add the send icon at the right of page...
          IconButton(
            onPressed: onSendButtonPressed,
            icon: Icon(Icons.send),
            color: Colors.white,
          )
        ],
      ),

      // bottom input format
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    );
  }
}
