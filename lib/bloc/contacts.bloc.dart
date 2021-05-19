import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/bloc/messages/messages.action.dart';
import 'package:flutter_project/bloc/messages/messages.bloc.dart';
import 'package:flutter_project/enums/enums.dart';
import 'package:flutter_project/model/contact.model.dart';
import 'package:flutter_project/repositories/contacts.repo.dart';

import 'contacts.action.dart';
import 'contacts.state.dart';


class ContactsBloc extends Bloc<ContactsEvent,ContactsState>{
  ContactsRepository contactsRepository;
  MessageBloc messageBloc;
  ContactsBloc({ContactsState initialState,this.contactsRepository,this.messageBloc}): super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if(event is LoadAllContactsEvent){
       yield ContactsState(contacts: state.contacts,requestState: RequestState.LOADIND,currentEvent:  event);
       try {
         List<Contact> data= await contactsRepository.allContacts();
         yield ContactsState(contacts: data,requestState: RequestState.LOADED,currentEvent: event,currentContact: data[0]);
         messageBloc.add(new MessagesByContactEvent(data[0]));
       } catch (e) {
         yield ContactsState(contacts: state.contacts,requestState: RequestState.ERROR,errorMessage: e.message,currentEvent: event);
       }
    }else if(event is LoadStudentsEvent){
      yield ContactsState(contacts: state.contacts,requestState: RequestState.LOADIND,currentEvent:  event);
      try {
        List<Contact> data= await contactsRepository.contactsByType("Student");
        yield ContactsState(contacts: data,requestState: RequestState.LOADED,currentEvent: event);
      } catch (e) {
        yield ContactsState(contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    }else if(event is LoadDevelopperEvent){
      yield ContactsState(contacts: state.contacts,requestState: RequestState.LOADIND,currentEvent:  event);
      try {
        List<Contact> data= await contactsRepository.contactsByType("Developper");
        yield ContactsState(contacts: data,requestState: RequestState.LOADED,currentEvent: event);
      } catch (e) {
        yield ContactsState(contacts: state.contacts,requestState: RequestState.ERROR,errorMessage: e.message,currentEvent: event);
    }

    }
  }


}