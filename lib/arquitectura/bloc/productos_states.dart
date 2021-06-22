part of 'productos_bloc.dart';



abstract class ProductoState extends Equatable {
  const ProductoState();

  @override
  List<Object> get props => [];
}

// Tres estados
// 1. Producto cargando -> los productos estan cargando
// 2. Prodcuto cargado -> los productos  han cargado
// 3. Producto No Cargado -> no se pudo cargar los productos

class ProductoCargando extends ProductoState {
  @override
  String toString() => 'Producto cargando';
}

class ProductoCargado extends ProductoState {
  final List<Productos> productos;

  const ProductoCargado([this.productos]);

  @override
  List<Object> get props => [productos];

  @override
  String toString() => 'Producto cargado';
}

class ProductoNoCargado extends ProductoState {
  @override
  String toString() => 'Producto No Cargado';
}