import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/bloc/messages/messages.action.dart';
import 'package:flutter_project/bloc/messages/messages.bloc.dart';
import 'package:flutter_project/model/contact.model.dart';
import 'package:flutter_project/ul/pages/messaages/messages.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesFormWidget extends StatelessWidget{
  TextEditingController textEditingController=new TextEditingController();
  Contact contact;

  MessagesFormWidget(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                controller: textEditingController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText:"Your message" ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  )
                ),
              )
          ),
          IconButton(icon: Icon(Icons.send), onPressed: (){
            Message message=Message(type:'sent',contactID:contact.id,content:textEditingController.text,selected: false);
            context.read<MessageBloc>().add(new AddNewMessagesEvent(message));

            Message replay=Message(type:'recieved',contactID:contact.id,content:'Answer to '+textEditingController.text,selected: false);
            context.read<MessageBloc>().add(new AddNewMessagesEvent(replay));
            textEditingController.text="";

            },)
        ],
      ),
    );
  }
  
}