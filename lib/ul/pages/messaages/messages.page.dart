import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/bloc/messages/messages.action.dart';
import 'package:flutter_project/bloc/messages/messages.bloc.dart';
import 'package:flutter_project/bloc/messages/messages.state.dart';
import 'package:flutter_project/enums/enums.dart';
import 'package:flutter_project/model/contact.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/ul/pages/contacts/widget/messages.list.widget.dart';
import 'package:flutter_project/ul/pages/messaages/widgets/contacts.ino.widget.dart';
import 'package:flutter_project/ul/pages/messaages/widgets/messages.appBarWidget.dart';
import 'package:flutter_project/ul/pages/messaages/widgets/messages.form.widget.dart';
import 'package:flutter_project/ul/pages/messaages/widgets/messages.widget.dart';
import 'package:flutter_project/ul/shared/circular%20progress.widget.dart';
import 'package:flutter_project/ul/shared/error.retry%20action.dart';

class MessagePage extends StatelessWidget{
  Contact contact;
  @override
  Widget build(BuildContext context) {
    this.contact=ModalRoute.of(context).settings.arguments;
    context.read<MessageBloc>().add(MessagesByContactEvent(this.contact));
    return Scaffold(
      appBar: MyAppBarWidget(this.contact),
      body: Column(
          children: [
            ContactInfoWidget(contact),
           MessagesWidget(),
            MessagesFormWidget(contact)
          ],
        )
      );
  }

}