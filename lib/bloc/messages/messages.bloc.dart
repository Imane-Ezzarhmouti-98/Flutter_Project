import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/bloc/messages/messages.action.dart';
import 'package:flutter_project/bloc/messages/messages.state.dart';
import 'package:flutter_project/enums/enums.dart';
import 'package:flutter_project/repositories/messages.repository.dart';
import 'package:flutter_project/ul/pages/messaages/messages.model.dart';

class MessageBloc extends Bloc<MessagesEvent,MessageState> {
  MessageRepository messageRepository;

  MessageBloc({@required MessageState initialState, this.messageRepository})
      : super(initialState);

  @override
  Stream<MessageState> mapEventToState(MessagesEvent event) async* {
    if (event is MessagesByContactEvent) {
      yield MessageState(
          requestState: RequestState.LOADIND, messages: state.messages,currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: event.payload);
      try {
        List<Message> data = await messageRepository.messagesByContact(event.payload.id);

        yield MessageState(requestState: RequestState.LOADED, messages: data, currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: event.payload);
      } catch (e) {
        yield MessageState(requestState: RequestState.ERROR, messageError: e.toString(), messages: state.messages, currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: event.payload);
      }
    }
    else if (event is AddNewMessagesEvent) {
      yield MessageState(
          requestState: RequestState.LOADIND, messages: state.messages,currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: state.currentContact);
      try {
        event.payload.date = DateTime.now();
        Message message = await messageRepository.addNewMessage(event.payload);
        List<Message> data = [...state.messages];
        data.add(message);
        yield MessageState(requestState: RequestState.LOADED,
            messages: data,
            currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: state.currentContact);
      } catch (e) {
        yield MessageState(requestState: RequestState.ERROR,
            messageError: e.toString(),
            messages: state.messages,
            currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: state.currentContact);
      }
    }

    else if (event is SelectMessageEvent) {
      List<Message> messages = state.messages;
      List<Message> selected = [...state.selectedMessages];
      for (Message m in messages) {
        if (m.id == event.payload.id) {
          m.selected =!m.selected;
        }
        if (m.selected == true) {
          selected.add(m);
        }
        else {
          selected.removeWhere((element) => element.id == m.id);
        }
      }
      MessageState messageState=MessageState(messages: messages,selectedMessages: selected,currentMessageEvent: event,requestState: RequestState.LOADED,currentContact: state.currentContact);
      yield messageState;
    }


    else if (event is DeleteMessageEvent) {
      List<Message> messages = state.messages;
      List<Message> selected = [...state.selectedMessages];
      for(Message m in selected){
       try {
         await messageRepository.deleteMessage(m);
         messages.removeWhere((element) => element.id==m.id);
         MessageState messageState=MessageState(messages: messages,selectedMessages: selected,currentMessageEvent: event,requestState: RequestState.LOADED,currentContact: state.currentContact);
         yield messageState;
       } catch (e) {
         MessageState messageState=MessageState(messages: messages,selectedMessages: selected,currentMessageEvent: event,requestState: RequestState.ERROR,currentContact: state.currentContact);
         yield messageState;
       }
      }

    }
  }
}
