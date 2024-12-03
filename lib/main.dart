import 'package:cubit_state_management_listexample/addListPage.dart';
import 'package:cubit_state_management_listexample/cubitList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Map<String, dynamic>> mNotes = [];

void main() {
  runApp( BlocProvider(create: (context)=>cubitList(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView.builder( itemCount: mNotes.length,
          itemBuilder: (_, index){
            return ListTile(
              title: Text(mNotes[index]["title"]),
              subtitle: Text(mNotes[index]["desc"]),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> addListPage()));
      },
      child: Icon(Icons.arrow_right),),
    );

  }
}

