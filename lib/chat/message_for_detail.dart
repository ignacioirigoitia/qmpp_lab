


import 'package:flutter/material.dart';
import 'package:xmpp_lab/chat/text_message.dart';
import 'package:xmpp_plugin/models/message_model.dart';


class MessageForDetailProduct extends StatefulWidget {

  const MessageForDetailProduct({
    Key? key, 
    required this.message,
  }) : super(key: key);

  final MessageChat message;

  @override
  State<MessageForDetailProduct> createState() => _MessageForDetailProductState();
}

class _MessageForDetailProductState extends State<MessageForDetailProduct> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: !(widget.message.from!.split('/').first == 'nicode@jabjab.de') ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              TextMessageForDetailProduct(message: widget.message),
            ],
          ),
        ),
      ),
    );
  }
}

