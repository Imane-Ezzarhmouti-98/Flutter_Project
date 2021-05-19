import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/messages/messages.action.dart';
import 'package:flutter_project/bloc/messages/messages.bloc.dart';

import '../messages.model.dart';
class MessageItemWidget extends StatelessWidget{
  Message message;
  MessageItemWidget(this.message);

  @override
  Widget build(BuildContext context) {
   return ListTile(
     selected: message.selected,
     selectedTileColor: Colors.black12,
     onLongPress: (){
          context.read<MessageBloc>().add(new SelectMessageEvent(message));
     },
     title: Row(
       mainAxisAlignment:(message.type=='recieved')? MainAxisAlignment.start:MainAxisAlignment.end,
       children: [
         (message.type=='recieved')?SizedBox(width: 0,):SizedBox(width: 40,),
         Flexible(
           child: Container(
             padding: EdgeInsets.all(20),
             foregroundDecoration: BoxDecoration(
               border:Border.all(color: Colors.blue)
             ),
             color: (message.type=='recieved')?Color.fromARGB(20, 0, 255, 0):Color.fromARGB(20, 255, 255, 0),
             child: Text('${message.content}(${message.date.day}/${message.date.month}/${message.date.year}-${message.date.hour}:${message.date.minute})'),
           ),
         ),
         (message.type=='recieved')?SizedBox(width: 40,):SizedBox(width: 0,)
       ],
     ),
   );
  }

}