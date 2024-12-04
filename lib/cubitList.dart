import 'package:cubit_state_management_listexample/listState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cubitList extends Cubit<listState>{
  /// initial data
  cubitList() : super(listState(mData: []));

  /// Now we will make a function to add data

  addMap(Map<String, dynamic> eachdata){
    List<Map<String, dynamic>> currentstate = state.mData;

    /// item added in current data
    currentstate.add(eachdata);

    emit(listState(mData: currentstate));
  }

 /// update data
     updataMap({required int index,
       required Map<String, dynamic> updatedData}){

      var currentstate = state.mData;
       currentstate[index] = updatedData;

       emit(listState(mData: currentstate));
     }

 /// Delete data
      deleteMap({required int index}){
         var currentstate = state.mData;
         currentstate.removeAt(index);
         emit(listState(mData: currentstate));
}
}