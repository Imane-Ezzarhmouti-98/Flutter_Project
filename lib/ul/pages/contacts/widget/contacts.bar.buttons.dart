import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/contacts.action.dart';
import 'package:flutter_project/bloc/contacts.bloc.dart';
import 'package:flutter_project/ul/pages/contacts/widget/contacts.button.Item.dart';

class ContactsBarButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           ContactsButtonItem( buttonLabel: 'All Contacts', contactsEvent: new LoadAllContactsEvent(),),
          ContactsButtonItem( buttonLabel: 'Students', contactsEvent: new LoadStudentsEvent(),),
          ContactsButtonItem( buttonLabel: 'Developpers', contactsEvent: new LoadDevelopperEvent(),)

        ],
      ),
    );
  }

}