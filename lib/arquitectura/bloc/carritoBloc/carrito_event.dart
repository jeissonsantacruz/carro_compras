import 'package:carro_compras/dominio/modelos/productos_modelo.dart';


import 'carrito_states.dart';

/* Esta clase contiene la implementacion de los eventos del Bloc Carrito de Compras */

class AgregarCarro extends BlocEvent {
  Productos product;
 
  AgregarCarro({this.product});
}
class EliminarCarro extends BlocEvent {
  Productos product;
  EliminarCarro({this.product});
}
class VaciarCarro extends BlocEvent {}
class LoadedState extends BlocState {
  List<Productos> products;
  LoadedState({this.products});
}


