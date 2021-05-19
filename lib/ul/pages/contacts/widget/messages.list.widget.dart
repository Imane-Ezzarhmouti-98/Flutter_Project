import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ul/pages/messaages/messages.model.dart';
import 'package:flutter_project/ul/pages/messaages/widgets/messages.item.widget.dart';

class MessagesListWidget extends StatelessWidget{
  List<Message> messages;
  ScrollController scrollController=new ScrollController();
  MessagesListWidget(this.messages);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      if(scrollController.hasClients)
        this.scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    return  ListView.separated(
      controller: scrollController,
        itemBuilder: (context,index)=>
             MessageItemWidget(messages[index]),
        separatorBuilder: (context,index)=> Divider(color: Colors.blue,height: 2,),
        itemCount: messages.length);
  }

}