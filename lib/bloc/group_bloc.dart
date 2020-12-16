import 'package:bloc/bloc.dart';
import 'package:desktop/data_object/product/productgroup.dart';
import 'package:desktop/repository/product_repo.dart';
import 'package:equatable/equatable.dart';

class GroupEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class FetchGroup extends GroupEvent{
  final String head;
  FetchGroup(this.head);
}
class GroupState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class GroupIsloading extends GroupState{

}
class GroupIsLoaded extends GroupState{
  final List<Productgroup> _group;

  List<Productgroup> get group => _group; // get _group => _group;

  GroupIsLoaded(this._group);
  @override
  // TODO: implement props
  List<Object> get props => [_group];
}
class GroupBloc extends Bloc<GroupEvent,GroupState>{

  ProductRepo productRepo;
  GroupBloc(this.productRepo) : super(GroupIsloading());
  // ProductBloc(this.productRepo);
  @override
  Stream<GroupState> mapEventToState(GroupEvent event) async*{
    // TODO: implement mapEventToState
    if(event is FetchGroup){
      yield GroupIsloading();
      try{
        print(event.head);
        List<Productgroup> groupList = await productRepo.getProductGroup(event.head);
        print("before");
        yield GroupIsLoaded(groupList);

        print("pass");
      }catch(e){
        yield GroupIsloading();
        print(e.toString());
      }
    }
  }

}