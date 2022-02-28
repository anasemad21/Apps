import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/cubit/cubit_todo_app.dart';
import 'package:project/shared/cubit/statess_todo_app.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){},
        builder:(context,state)
        {
          var tasks=AppCubit.get(context).newtasks;
          return tasksBuilder(
            tasks: tasks,
          );
        },
    )
      ;
  }
}
