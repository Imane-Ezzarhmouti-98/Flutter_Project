import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/messages/messages.bloc.dart';
import 'package:flutter_project/bloc/messages/messages.state.dart';
import 'package:flutter_project/enums/enums.dart';
import 'package:flutter_project/ul/pages/contacts/widget/messages.list.widget.dart';
import 'package:flutter_project/ul/shared/circular%20progress.widget.dart';
import 'package:flutter_project/ul/shared/error.retry%20action.dart';

class MessagesWidget  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MessageBloc,MessageState>(
          builder: (context,state){
            if(state.requestState==RequestState.LOADIND){
              return MyCircularProgressIndWidget() ;
            }
            else if(state.requestState==RequestState.ERROR){
              return ErrorRetryMessage(errorMessage: state.messageError,
                onAction: (){
                  context.read<MessageBloc>().add(state.currentMessageEvent);
                },
              );
            }
            else if(state.requestState==RequestState.LOADED){
              return MessagesListWidget(state.messages);
            }
            else{
              return Container();
            }

          }

      ),
    );
  }

}