import 'package:cubit_state_management_listexample/cubitList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addListPage extends StatelessWidget{

  List<Map<String, dynamic>> mNotes = [];

  @override
  Widget build(BuildContext context) {

    mNotes = context.watch<cubitList>().state.mData;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.read<cubitList>().addMap({
            "title" : "Imp Note",
            "desc" : "Study hard"
          });
        },
            child: Text("Add")),
      ),
    );
  }
}