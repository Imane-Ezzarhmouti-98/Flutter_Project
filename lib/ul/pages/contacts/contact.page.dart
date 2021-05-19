import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/contacts.action.dart';
import 'package:flutter_project/bloc/contacts.bloc.dart';
import 'package:flutter_project/bloc/contacts.state.dart';
import 'package:flutter_project/enums/enums.dart';
import 'package:flutter_project/ul/pages/contacts/widget/contacts.bar.buttons.dart';
import 'package:flutter_project/ul/pages/contacts/widget/contacts.list.dart';
import 'package:flutter_project/ul/shared/error.retry%20action.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          ContactsBarButtons(),
          Expanded(
            child: BlocBuilder<ContactsBloc,ContactsState>(builder: (context,state){
                  if(state.requestState==RequestState.LOADIND){
                    return Center(child: CircularProgressIndicator());
                  }else if(state.requestState==RequestState.ERROR){
                    return ErrorRetryMessage(
                      errorMessage: state.errorMessage,
                      onAction: (){
                        context.read()<ContactsBloc>().add(state.currentEvent);
                      },
                    );
                  }
                  else if(state.requestState==RequestState.LOADED){
                           return ContactsList(contacts: state.contacts,);
                  }else{
                    return Container();
                  }
            }),
          )

        ],

      ),
    );
  }
}
