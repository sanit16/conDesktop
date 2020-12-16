import 'package:flutter_bloc/flutter_bloc.dart';
class ProductBlockObserver extends BlocObserver {


  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition.currentState);
    print(transition.nextState);

  }

  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
  }
}