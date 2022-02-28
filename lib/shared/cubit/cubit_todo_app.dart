
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import 'package:project/modules/todo_app/done_tasks/done_tasks_screen.dart';
import 'package:project/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:project/shared/cubit/statess_todo_app.dart';
import 'package:project/shared/network/local/cash_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(AppInitialState());
   static AppCubit get(context)=>BlocProvider.of(context);

  List<Map> newtasks=[];
  List<Map> donetasks=[];
  List<Map> archivedtasks=[];
  late Database database;
  int currentindex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void changIndex(int index)
  {
    currentindex=index;
    emit(AppChangeBottomNavBarState());
  }


  void getDatafromdatabase(database)  {
    newtasks=[];
    donetasks=[];
    archivedtasks=[];
    emit(AppGetDataBaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value)
    {

      value.forEach((element)
      {
        if(element['status']=='new')
          newtasks.add(element);
        else if(element['status']=='done')
          donetasks.add(element);
        else
          archivedtasks.add(element);
      });
      emit(AppGetDataBaseState());
    });
  }


void updateDatabase({
  required String status,
  required int id,
}) async
  {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
   ).then((value)
    {
      getDatafromdatabase(database);
      emit( AppUpdateDataBaseState());
    });
}


  void deleteDatabase({

    required int id,
  }) async
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id])
        .then((value) {
      getDatafromdatabase(database);
      emit(AppDeleteDataBaseState());
    });
  }


  void createDatabase()  {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,data TEXT,time TEXT,status TEXT) ')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error when creaed table${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDatafromdatabase(database);
        print('database opended');
      },
    ).then((value){
      database=value;
      emit(AppCreateDataBaseState());
    } );
  }

   insertDatabase({
    required String title,
    required String time,
    required String data,
  }) async
   {
    await database.transaction((txn) {
     return txn.rawInsert(
          'INSERT INTO tasks(title,data,time,status) VALUES("$title","$data","$time","new")')
          .then((value) {
        print("$value inserted successfully");
        emit(AppInsertDataBaseState());
        getDatafromdatabase(database);
      }).catchError((error) {
        print('Error when inserted new record ${error.toString()}');
      });
    });
  }


  bool isbottomsheet = false;
  IconData iconbuttom = Icons.add;
  void changeBottomSheetState({
  required bool isShow,
    required IconData icon,
})
  {
    isbottomsheet=isShow;
    iconbuttom=icon;
    emit(AppChangeBottomSheetState());
  }


  bool isDark=false;
  void changeThemeMode({bool? fromShared})
  {
    if(fromShared!=null)
      {
        isDark=fromShared;
        emit(AppChangeThemeModeState());
      }
    else{
      isDark=!isDark;
      CashHelper.putBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(AppChangeThemeModeState());
      });
    }
  }

}