import 'package:desktop/data_object/product/product.dart';
import 'package:desktop/repository/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BucketEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => [];

}
class FetchBucket extends BucketEvent{
  final String customer_id;

  FetchBucket(this.customer_id);
}
class AddProduct extends BucketEvent{
  final Product product;

  AddProduct(this.product);
}
class BucketState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class HaveProduct extends BucketState{
}
class NoneState extends BucketState{
}
class BucketBloc extends Bloc<BucketEvent,BucketState>{
  BucketBloc(BucketState initialState) : super(NoneState());
  ProductRepo productRepo;
  @override
  Stream<BucketState> mapEventToState(BucketEvent event) {
    if (event is FetchBucket) {

    }
  }

}
