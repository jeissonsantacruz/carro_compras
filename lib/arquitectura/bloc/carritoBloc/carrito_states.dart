abstract class BlocEvent{}
abstract class BlocState {}
/* Clase que contiene los estados del Bloc Carrito de compras */
class CargandoState extends BlocState{}
class CarroNoCargadoState extends BlocState {
  Exception error;
  CarroNoCargadoState({this.error});
}
