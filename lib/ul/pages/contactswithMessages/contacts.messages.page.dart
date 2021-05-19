import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/contacts.action.dart';
import 'package:flutter_project/bloc/contacts.bloc.dart';
import 'package:flutter_project/bloc/contacts.state.dart';
import 'package:flutter_project/bloc/messages/messages.action.dart';
import 'package:flutter_project/bloc/messages/messages.bloc.dart';
import 'package:flutter_project/bloc/messages/messages.state.dart';
import 'package:flutter_project/enums/enums.dart';
import 'package:flutter_project/model/contact.model.dart';
import 'package:flutter_project/ul/pages/contacts/widget/messages.list.widget.dart';
import 'package:flutter_project/ul/pages/contactswithMessages/widget/contact.list.widget.dart';
import 'package:flutter_project/ul/pages/messaages/widgets/messages.appBarWidget.dart';
import 'package:flutter_project/ul/pages/messaages/widgets/messages.form.widget.dart';
import 'package:flutter_project/ul/pages/messaages/widgets/messages.widget.dart';
import 'package:flutter_project/ul/shared/circular%20progress.widget.dart';
import 'package:flutter_project/ul/shared/error.retry%20action.dart';

class ContactsWithMessages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(new LoadAllContactsEvent());
    return BlocBuilder<MessageBloc,MessageState>(
      builder: (context,state)=>Scaffold(
          appBar: MyAppBarWidget(state.currentContact),
          body: Column(
            children: [
              ContactsListHorizontalWidget(),
              MessagesWidget(),
            MessagesFormWidget(state.currentContact),
        ],
          )
      ),
    );

  }

}