import 'package:flutter_project/enums/enums.dart';
import 'package:flutter_project/model/contact.model.dart';

import 'contacts.action.dart';

class ContactsState{
  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactsEvent currentEvent;
  Contact currentContact;

  ContactsState({
    this.contacts,this.requestState,
    this.errorMessage,this.currentEvent,this.currentContact});
}