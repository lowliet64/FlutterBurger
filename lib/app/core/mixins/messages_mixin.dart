import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController{

  void messageListener(){


  }
}

class MessageModel{
  final String title;
  final String message;
  final MessageType type;

  MessageModel({ required this.title, required this.message, required this.type});
  


}


enum MessageType{error,info}

extension MessageTypeColorExt on MessageType {
  Color color(){
    switch(this){
      case MessageType.error:
        return Colors.red[800]!;
      case MessageType.info:
        return Colors.blue[200]!;

    }
  }
}