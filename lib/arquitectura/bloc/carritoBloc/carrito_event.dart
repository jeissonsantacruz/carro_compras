import 'package:carro_compras/dominio/modelos/productos_modelo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'carrito_states.dart';



class AddToCart extends BlocEvent {
  Productos product;
  AddToCart({this.product});
}
class DelFromCart extends BlocEvent {
  Productos product;
  DelFromCart({this.product});
}
class ClearCart extends BlocEvent {}
class LoadedState extends BlocState {
  List<Productos> products;
  LoadedState({this.products});
}


class ProductBloc extends Bloc<BlocEvent, BlocState>{
  ProductBloc() : super();

  List<Productos> cartProducts = [];
   @override
  BlocState get initialState => LoadingState();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async*{
    yield LoadingState();
    try{
      if (event is AddToCart)
        cartProducts.add(event.product);
      if (event is DelFromCart)
        cartProducts.remove(event.product);
      if (event is ClearCart)
        cartProducts = [];
      yield LoadedState(products: cartProducts);
    }
    catch(e){
      yield FailedToLoadState(error: e);
    }
  }
}