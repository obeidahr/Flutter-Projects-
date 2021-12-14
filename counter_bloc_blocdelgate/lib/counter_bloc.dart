import 'package:counter_bloc_blocdelgate/counter_event.dart';
import 'package:bloc/bloc.dart';

//create Bloc<input,output>
class CounterBloc extends Bloc<CounterEvent, int> {
 CounterBloc(int initialState) : super(initialState);

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.add:
        yield state + 1;
        break;
      case CounterEvent.remove:
        yield state - 1;
        break;
    }
  }
  @override
    void onTransition(Transition<CounterEvent, int> transition) {
      super.onTransition(transition);
      print(transition);
    }
  @override
    void onEvent(CounterEvent event) {
      // TODO: implement onEvent
      super.onEvent(event);
      //print(event);
    }  
  @override
    void onError(Object error, StackTrace stackTrace) {
      super.onError(error, stackTrace);
    }
}
