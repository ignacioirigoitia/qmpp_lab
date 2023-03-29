import 'package:flutter/material.dart';

class ChatInputField extends StatefulWidget {

  final String idRequest;
  final void Function(String) inputSend;
  final void Function() typing;
  final Color? color;
  final bool withOutShadow;

  const ChatInputField({
    Key? key, 
    required this.idRequest, 
    required this.inputSend,
    required this.typing,
    this.color,
    this.withOutShadow = true
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {

  @override
  void initState() {
    super.initState();

  }

  final TextEditingController controller = new TextEditingController();
  GlobalKey<FormState> formChat = new GlobalKey();
  

  bool isSending = false;
  FocusNode myfocus = FocusNode();
  bool isEmoji = false;

  @override
  Widget build(BuildContext context) {

    

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: SafeArea(
            child: Form(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20 * 0.75),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => setState(() => isEmoji = !isEmoji),
                            icon: Icon(Icons.sentiment_satisfied_alt_outlined),
                            color: Colors.grey,
                          ),
                          SizedBox( width: 5),
                          Expanded(
                            child: TextFormField(
                              focusNode: myfocus,
                              controller: controller,  
                              style: TextStyle(color: Colors.grey),
                              onFieldSubmitted: (value) async {
                                widget.inputSend(value);
                                controller.clear();
                              },
                              decoration: InputDecoration(
                                hintText: 'Escribe aqui',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none
                              ),
                            )
                          ),

                          SizedBox(width: 10),

                          IconButton(
                              onPressed: () {
                                widget.inputSend(controller.value.text);
                                controller.clear();
                              }, 
                              icon: Icon(Icons.send),
                              color: !isSending ? Colors.grey : Color.fromRGBO(74, 153, 223, 1),
                            )
                        ],
                      ),
                    )
                  )
                ],
              ),
            )
          ),
        ),
      ],
    );
  }
}