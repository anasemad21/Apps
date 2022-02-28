import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import 'package:project/shared/components/components.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/cubit/cubit_todo_app.dart';
import 'package:project/shared/cubit/statess_todo_app.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  var scafoldform = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var tittlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){
          if(state is AppInsertDataBaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (context,state)
        {
          AppCubit cubit=AppCubit.get(context);
          return Scaffold(
            key: scafoldform,
            appBar: AppBar(
              title: Text(
                  cubit.titles[cubit.currentindex]),
            ),
            body: ConditionalBuilder(
                condition: state is! AppGetDataBaseLoadingState,
                builder: (context) => cubit.screens[cubit.currentindex],
                fallback: (context) => Center(child: CircularProgressIndicator())),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                //insertDatabase();
                if (cubit.isbottomsheet) {
                  if (formkey.currentState!.validate())
                  {
                    cubit.insertDatabase(
                      title: tittlecontroller.text,
                        time: timecontroller.text,
                        data: datecontroller.text,);
                    // insertDatabase(
                    //   data: datecontroller.text,
                    //   time: timecontroller.text,
                    //   title: tittlecontroller.text,
                    // ).then((value) {
                    //   getDatafromdatabase(database).then((value) {
                    //     Navigator.pop(context);
                    //     // setState(() {
                    //     // isbottomsheet = false;
                    //     // iconbuttom = Icons.edit;
                    //     // tasks=value;
                    //     // print(tasks);
                    //     // });
                    //   });
                    // });
                  }
                } else {
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add,);
                  scafoldform.currentState!
                      .showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(
                        20.0,
                      ),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defultTextFormField(
                              type: TextInputType.text,
                              label: 'Task title',
                              prefix: Icons.title_outlined,
                              controller: tittlecontroller,
                              validate: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'title must not be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defultTextFormField(
                              type: TextInputType.datetime,
                              label: 'Task time',
                              prefix: Icons.watch_later_outlined,
                              controller: timecontroller,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  timecontroller.text =
                                      value!.format(context).toString();
                                  print(value.format(context));
                                });
                              },
                              validate: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'time must not be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defultTextFormField(
                              type: TextInputType.datetime,
                              label: 'Task date',
                              prefix: Icons.calendar_today,
                              controller: datecontroller,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2030-12-20'),
                                ).then((value) {
                                  print(DateFormat.yMMMd().format(value!));
                                  datecontroller.text =
                                      DateFormat.yMMMd().format(value);
                                });
                              },
                              validate: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'date must not be empty';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value) {
                   cubit.changeBottomSheetState(isShow: false, icon: Icons.edit,);
                  });
                }
              },
              child: Icon(
                cubit.iconbuttom,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'archived',
                ),
              ],
            ),
          );
        },

      ),
    );
  }

  Future<String> Getname() async {
    return 'Anas Emad';
  }

}
