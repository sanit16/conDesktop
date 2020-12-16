import 'package:bloc/bloc.dart';
import 'package:desktop/data_object/product/product.dart';
import 'package:desktop/data_object/product/productgroup.dart';
import 'package:desktop/repository/product_repo.dart';
import 'package:equatable/equatable.dart';

class ProductEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class FetchProduct extends ProductEvent{
  final String head;
  final String group;
  FetchProduct(this.head,this.group);
}
class ResetProduct extends ProductEvent{

}
class AddProduct extends ProductEvent{
  Product product;

  AddProduct(this.product);

}
class RemoveProduct extends ProductEvent{

}
class IncreaseProduct{}
class DecreaseProduct{}
class ProductState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
  List<Product> BucketList = new List<Product>();
}

class ProductNotSearch extends ProductState{}
class ProductIsLoading extends ProductState{}
class ProductIsLoaded extends ProductState{
  final List<Product> _product;
  get product => _product;
  ProductIsLoaded(this._product);
  @override
  // TODO: implement props
  List<Object> get props => [_product];
}
class ProductIsNotLoaded extends ProductState{
}
class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductRepo productRepo;
  ProductBloc(this.productRepo) : super(ProductIsNotLoaded());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    // TODO: implement mapEventToState
    List<Product> product;
    if (event is FetchProduct) {
      yield ProductIsLoading();
      try{
        product = await productRepo.getProductList(event.head, event.group);
         yield ProductIsLoaded(product);
      }catch(_){
        yield ProductIsNotLoaded();
      }
    }else if (event is ResetProduct){
      yield ProductNotSearch();
    }
    else {}
  }

}