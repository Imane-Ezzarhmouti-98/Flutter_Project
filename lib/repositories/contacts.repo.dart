import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/model/contact.model.dart';

class ContactsRepository{
  Map<int,Contact> contacts={
    1:Contact(id:1,name:'Mohamed',profile:'MO',score:134,type: 'Student'),
    2:Contact(id:2,name:'Yassine',profile:'YA',score:432,type: 'Student'),
    3:Contact(id:3,name:'Imane',profile:'IM',score:644,type: 'Developper'),
    4:Contact(id:4,name:'Hanane',profile:'HA',score:876,type: 'Student'),
    5:Contact(id:5,name:'Ahmed',profile:'AH',score:934,type: 'Developper'),
  };
  Future<List<Contact>> allContacts() async{
    var future=await Future.delayed(Duration(seconds: 1));
    int rnd=new Random().nextInt(10);
    if(rnd>1){
      return contacts.values.toList();
    }else{
      throw new Exception("Internet Error");
    }

  }
  Future<List<Contact>> contactsByType(String type) async{
    var future=await Future.delayed(Duration(seconds: 1));
    int rnd=new Random().nextInt(10);
    if(rnd>1){
      return contacts.values.toList().where((element) =>element.type==type).toList();
    }else{
      throw new Exception("Internet Error");
    }

  }
}