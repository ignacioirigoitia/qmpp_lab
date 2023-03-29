





import 'package:flutter/material.dart';

import 'package:xmpp_plugin/models/message_model.dart';


import 'chat_input_field.dart';
import 'message_for_detail.dart';



class CardChat extends StatefulWidget  {
  const CardChat({
    Key? key, 
    required this.idRequest, 
    this.withMargin = true, 
    required this.messages,
    required this.onSend
  }) : super(key: key);

  final String idRequest;
  final bool withMargin;
  final List<MessageChat> messages;
  final Function(String) onSend;

  @override
  State<CardChat> createState() => _CardChatState();

}

class _CardChatState extends State<CardChat> {


  final ScrollController _scrollController = new ScrollController();

  bool flag = false;  

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.withMargin ? EdgeInsets.only(right: 20, left: 10, bottom: 20) : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              // if(chatProvider.actualMembers.isNotEmpty)
              //   HeaderChat(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: widget.messages.length == 0 ? 1 : widget.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(widget.messages.length == 0){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Chat', style: TextStyle(fontSize: 20, color: Colors.grey)),
                        ),
                      );
                    }
    
                    return (widget.messages[index].customText == 'imagen')
                      ? Container(
                          width: 200,
                          height: 150,
                          child: Image.network(widget.messages[index].body!, fit: BoxFit.cover,),
                        )
                      : MessageForDetailProduct( message: widget.messages[index] );
                  }
                )
              ),
              ChatInputField(
                inputSend: (arg){
                  widget.onSend(arg);
                },
                typing: (){},
                idRequest: this.widget.idRequest 
              ),
            ],
          ),
        ],
      ),             
    );
  }
}