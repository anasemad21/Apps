import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/counter_app/counter/cubit/statess.dart';


class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit():super(CounterInitialState());
  static CounterCubit get(context)=>BlocProvider.of(context);
  int counter=1;
  void  minus()
  {
    counter--;
    emit(CounterMinusState(counter));
  }
  void  plus()
  {
    counter++;
    emit(CounterPlusState(counter));
  }

}