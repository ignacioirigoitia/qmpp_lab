import 'package:flutter/material.dart';

import 'dart:convert' show utf8;

import 'package:xmpp_plugin/models/message_model.dart';

class TextMessageForDetailProduct extends StatelessWidget {
  const TextMessageForDetailProduct({
    Key? key, 
    required this.message,
  }) : super(key: key);

  final MessageChat message;

  @override
  Widget build(BuildContext context) {

    bool isMyMessage;

    if (message.from!.split('/').first == 'nicode@jabjab.de') {
      isMyMessage = false;
    } else {
      isMyMessage = true;
    }

    return Column(
      crossAxisAlignment: isMyMessage == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          width: 175,
          padding: EdgeInsets.symmetric(horizontal: !isMyMessage ? 12 : 15, vertical: !isMyMessage ? 8 : 10),
          margin: EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            color: isMyMessage ? Color.fromARGB(255, 114, 205, 169) : Color.fromARGB(255, 141, 183, 234),
            borderRadius: isMyMessage 
              ? BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
              : BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10), topLeft: Radius.circular(10))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(!isMyMessage)
                Text(
                  message.from.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),

              SelectableText(
                message.body.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),                
              ),
            ],
          )
        ),
        
        Container(
          margin: isMyMessage == true ? EdgeInsets.only(left: 15) : EdgeInsets.only(right: 5),
          child: Padding(
            padding: const EdgeInsets.only( right: 10),
            child: Text(
              '08/10',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}


String getStringFromEmojiMessage(String message) {
  String messageReturn = '';
  final list = message.split('isanemoji-./[]{}');
  for (var i = 0; i < list.length; i++) {
    if(list[i].contains('[') && list[i].contains(']')){
      messageReturn = messageReturn + utf8.decode(list[i].replaceAll('[', '').replaceAll(']', '').split(',')
        .map<int>((e) {
          return int.tryParse(e)!;
        }).toList());
    } else {
      messageReturn = messageReturn + list[i];
    }
  }
  return messageReturn;
}