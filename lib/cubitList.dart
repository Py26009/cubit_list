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
}