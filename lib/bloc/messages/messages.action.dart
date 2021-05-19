import 'package:flutter_project/model/contact.model.dart';
import 'package:flutter_project/ul/pages/messaages/messages.model.dart';

abstract class MessagesEvent<T>{
  T payload;
  MessagesEvent(this.payload);
}
class MessagesByContactEvent extends MessagesEvent<Contact>{
  MessagesByContactEvent(Contact payload) : super(payload);
}

class AddNewMessagesEvent extends MessagesEvent<Message>{
  AddNewMessagesEvent(Message payload) : super(payload);
}
class SelectMessageEvent extends MessagesEvent<Message>{
  SelectMessageEvent(Message payload) : super(payload);
}

class DeleteMessageEvent extends MessagesEvent{
  DeleteMessageEvent() : super(null);
}


