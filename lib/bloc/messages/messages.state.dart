import 'package:flutter_project/bloc/messages/messages.action.dart';
import 'package:flutter_project/enums/enums.dart';
import 'package:flutter_project/model/contact.model.dart';
import 'package:flutter_project/ul/pages/messaages/messages.model.dart';

class MessageState{
  RequestState requestState;
  List<Message> messages;
  String messageError;
  MessagesEvent currentMessageEvent;
  List<Message> selectedMessages=[];
  Contact currentContact;

  MessageState(
      {this.requestState,
        this.messages,
        this.messageError,
        this.currentMessageEvent,
        this.selectedMessages,
        this.currentContact,
      });
  MessageState.initialState():
      requestState=RequestState.NONE,
        messages=[],messageError='',
        currentMessageEvent=null,selectedMessages=[],
        currentContact=new Contact();
}