import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carro_compras/arquitectura/servicios/productos_repositorio.dart';
import 'package:carro_compras/dominio/modelos/productos_modelo.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'productos_event.dart';
part 'productos_states.dart';

/* Esta clase contiene la implementacion del  del Bloc Prodcutos */
class ProductosBloc extends Bloc<ProductoEvent, ProductoState> {
  final ProductosRepository _productoRepository;

  ProductosBloc({@required ProductosRepository productosRepository})
      : assert(productosRepository != null),
        _productoRepository = productosRepository;

  @override
  ProductoState get initialState => ProductoCargando();

  @override
  Stream<ProductoState> mapEventToState(
    ProductoEvent event,
  ) async* {
    if (event is CargarProductos) {
      yield* _mapCargarProductos();
    }
  }

  Stream<ProductoState> _mapCargarProductos() async* {
    yield ProductoCargando();
    try {
      final List<Productos> productos =
          await _productoRepository.getPosts().first;
      yield ProductoCargado(productos);
    } catch (_) {
      yield ProductoNoCargado();
    }
  }
}
