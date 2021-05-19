import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/messages/messages.action.dart';
import 'package:flutter_project/bloc/messages/messages.bloc.dart';
import 'package:flutter_project/bloc/messages/messages.state.dart';
import 'package:flutter_project/model/contact.model.dart';

class ContactHorizotalItemWidget extends StatelessWidget{
  Contact contact;
  ScrollController scrollController;
  int index;

  ContactHorizotalItemWidget({this.contact,this.index,this.scrollController});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          context.read<MessageBloc>().add(new MessagesByContactEvent(contact));
          scrollController.animateTo((index*200-150).toDouble(), duration: Duration(microseconds: 2000), curve: Curves.ease);
        },
        child:
        BlocBuilder<MessageBloc,MessageState>(
            builder:(context,messagesState)=>Card(
              elevation: 1,
              child: Container(padding: EdgeInsets.all(16),
                width: 150,
                child: Column(children:[
                  CircleAvatar(child: Text('${contact.profile}'),),
                  Text('${contact.name}'),
                  Text('${contact.score}'),
                ]),
                decoration:BoxDecoration(
                    border: Border.all(
                        width:(messagesState.currentContact==contact)?3:1 ,color: Colors.blue)
                ),
              ),
            )

        ),
      ),
    );
  }

}