import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/contacts.action.dart';
import 'package:flutter_project/bloc/contacts.bloc.dart';
import 'package:flutter_project/bloc/contacts.state.dart';

class ContactsButtonItem extends StatelessWidget{
  String buttonLabel;
  ContactsEvent contactsEvent;

  ContactsButtonItem({this.buttonLabel, this.contactsEvent});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc,ContactsState>(
      builder: (context,state){
        return Container(
        padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
        decoration: BoxDecoration(
        border: Border.all(
        width:(state.currentEvent.runtimeType==contactsEvent.runtimeType)?2:0 ,
        color: Colors.blue
        )
        ),
        child: RaisedButton(
        onPressed: () {
        context.read<ContactsBloc>().add(contactsEvent);
        },
        child: Text(
        buttonLabel,
        style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue,
        ),
        );
      },

    );
  }

}