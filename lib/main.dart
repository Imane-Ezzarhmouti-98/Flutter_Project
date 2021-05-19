import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/contacts.bloc.dart';
import 'package:flutter_project/bloc/messages/messages.bloc.dart';
import 'package:flutter_project/bloc/messages/messages.state.dart';
import 'package:flutter_project/model/contact.model.dart';
import 'package:flutter_project/repositories/contacts.repo.dart';
import 'package:flutter_project/repositories/messages.repository.dart';
import 'package:flutter_project/ul/pages/contacts/contact.page.dart';
import 'package:flutter_project/ul/pages/contactswithMessages/contacts.messages.page.dart';
import 'package:flutter_project/ul/pages/messaages/messages.page.dart';
import 'package:get_it/get_it.dart';

import 'bloc/contacts.state.dart';
import 'enums/enums.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  GetIt.instance.registerLazySingleton(() => new MessageRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>MessageBloc(initialState: MessageState.initialState(),
            messageRepository: GetIt.instance<MessageRepository>()

        ),),
          BlocProvider(create: (context)=> ContactsBloc(
            initialState: ContactsState(
                contacts: [],errorMessage: ' ',requestState: RequestState.NONE),
            contactsRepository:GetIt.instance<ContactsRepository>(),
            messageBloc: context.read<MessageBloc>()
          ),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          '/contacts': (context) => ContactPage(),
          '/messages': (context) => MessagePage(),
          '/contactsWithMessages': (context) => ContactsWithMessages()
        },
        initialRoute: '/contactsWithMessages',
      ),
    );
  }
}
