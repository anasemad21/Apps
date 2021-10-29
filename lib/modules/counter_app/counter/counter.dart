import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/counter_app/counter/cubit/statess.dart';
import 'cubit/cubit.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state)
        {
          if(state is CounterMinusState)
            {
              print('Minus state ${state.counter}');
            }
          if(state is CounterPlusState)
          {
            print('Plus state ${state.counter}');
          }
        },
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).minus();

                  },
                    child:  Text('MINNUS'),),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      '${ CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),),
                  ),
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).plus();
                  },
                    child:  Text('Plus'),),

                ],
              ),
            ),
          );
        },
      ),
    );
}

}
