part of 'productos_bloc.dart';

/* Esta clase contiene la implementacion de los eventos  del Bloc Prodcutos */
abstract class ProductoEvent extends Equatable {
  const ProductoEvent();

  @override
  List<Object> get props => [];
}

class CargarProductos extends ProductoEvent {}
