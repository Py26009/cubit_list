import 'package:cubit_state_management_listexample/addListPage.dart';
import 'package:cubit_state_management_listexample/cubitList.dart';
import 'package:cubit_state_management_listexample/listState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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


class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> mNotes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: BlocBuilder<cubitList, listState>(builder: (context, state) {
        return ListView.builder(
            itemCount: state.mData.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(state.mData[index]["title"]),
                subtitle: Text(state.mData[index]["desc"]),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                    IconButton(onPressed: (){
                      context.read<cubitList>().updataMap(index: index, updatedData: {
                        "title" : "life",
                        "desc" : "live life at the fullest"
                      });
                    }, icon: Icon(Icons.edit, color: Colors.blue,)),
                      IconButton(onPressed: (){
                        context.read<cubitList>().deleteMap(index: index);
                      }, icon: Icon(Icons.delete, color: Colors.red,)),
                    ],
                  ),
                )
              );
            });
      }),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> addListPage()));
      },
      child: Icon(Icons.arrow_right),),
    );

  }
}

