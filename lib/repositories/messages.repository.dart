import 'dart:math';

import 'package:flutter_project/ul/pages/messaages/messages.model.dart';

class MessageRepository{
  int messageCount;
  Map<int,Message> messages={
    1: Message(id: 1,contactID: 1,date: DateTime.now(),content: "Hello Mohammed",type:"sent",selected: false),
    2: Message(id: 1,contactID: 1,date: DateTime.now(),content: "what are you doing?",type:'received',selected: false),
    3: Message(id: 2,contactID: 1,date: DateTime.now(),content: "how are you doing?",type:'sent',selected: false),
    4: Message(id: 2,contactID: 1,date: DateTime.now(),content: "I am fine and you?",type:'recieved',selected: false),
    5: Message(id: 3,contactID: 2,date: DateTime.now(),content: "hi yassine",type:'sent',selected: false),
    6: Message(id: 4,contactID: 2,date: DateTime.now(),content: "No thing",type:'recieved',selected: false),
  };

 MessageRepository(){
   this.messageCount=messages.length;
 }

  Future<List<Message>> allMessages() async{
   var future= await Future.delayed(Duration(seconds: 1));
   int rnd= new Random().nextInt(10);
   if(rnd>1){
     return messages.values.toList();
   }
   else{
     throw new Exception("Internet Error");
   }


 }
  Future<List<Message>> messagesByContact(int contactId) async{
    var future= await Future.delayed(Duration(seconds: 1));
    int rnd= new Random().nextInt(10);
    if(rnd>1){
      return messages.values.toList().where((element) => element.contactID==contactId).toList();
    }
    else{
      throw new Exception("Internet Error");
    }


  }
  Future<Message> addNewMessage(Message message) async{
    var future= await Future.delayed(Duration(seconds: 1));
    int rnd= new Random().nextInt(10);
    if(rnd>1){
      message.id=++messageCount;
      messages[message.id]=message;
      return message;
    }
    else{
      throw new Exception("Internet Error");
    }


  }

  Future<Message> deleteMessage(Message message) async{
    var future= await Future.delayed(Duration(seconds: 1));
    int rnd= new Random().nextInt(10);
    if(rnd>1){
      messages.remove(message.id);
      return message;
    }
    else{
      throw new Exception("Internet Error");
    }


  }

}