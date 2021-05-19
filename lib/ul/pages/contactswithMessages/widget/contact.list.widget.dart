import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/contacts.bloc.dart';
import 'package:flutter_project/bloc/contacts.state.dart';
import 'package:flutter_project/bloc/messages/messages.action.dart';
import 'package:flutter_project/bloc/messages/messages.bloc.dart';
import 'package:flutter_project/bloc/messages/messages.state.dart';
import 'package:flutter_project/enums/enums.dart';
import 'package:flutter_project/ul/pages/messaages/widgets/ContactHorizotalItemWidget.dart';
import 'package:flutter_project/ul/shared/error.retry%20action.dart';

class  ContactsListHorizontalWidget extends StatelessWidget {
  ScrollController scrollController=new ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc,ContactsState>(
        builder: (context,state){
          if(state.requestState==RequestState.LOADIND){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state.requestState==RequestState.ERROR){
            return ErrorRetryMessage(
              errorMessage: state.errorMessage,
              onAction: (){
                context.read<ContactsBloc>().add(state.currentEvent);
              },
            );
          }
          else if(state.requestState==RequestState.LOADED){
            return  SizedBox(
              height: 150,
              child: ListView.builder(
                controller: scrollController,
                itemBuilder: (context,index)=>
                ContactHorizotalItemWidget( contact: state.contacts[index],index: index,scrollController: scrollController,),
                itemCount: state.contacts.length,
                scrollDirection: Axis.horizontal,
              ),
            );
          }
          else{
            return Container();
          }
        }
    );
  }
}