import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_states.dart';
import 'package:carro_compras/dominio/modelos/carro_modelo.dart';
import 'package:carro_compras/dominio/modelos/productos_modelo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'carrito_event.dart';

/* Esta clase contiene la implementacion del Bloc Carrito de Compras */
class CarritoBloc extends Bloc<BlocEvent, BlocState> {
  CarritoBloc() : super();
  // diccionario o mapa donde se guardan los productos y sus cantidades
  Map<Productos, int> carroProductos = {};

  @override
  BlocState get initialState => CargandoState();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    yield CargandoState();
    try {
      if (event is AgregarCarro) if (carroProductos.containsKey(event.product))
        carroProductos[event.product] += 1;
      else
        carroProductos[event.product] = 1;
      if (event is EliminarCarro) if (carroProductos[event.product] > 1)
        carroProductos[event.product] -= 1;
      else
        carroProductos.remove(event.product);
      if (event is VaciarCarro) carroProductos = {};
    } catch (e) {
      yield CarroNoCargadoState(error: e);
    }
  }
}
