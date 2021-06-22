import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_bloc.dart';
import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_event.dart';
import 'package:carro_compras/dominio/modelos/productos_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Clase que contiene una tarjeta customizada para mostar los productos del carrito */
class CarritoCard extends StatelessWidget {
  final Productos _prd;
  final Map mapa;
  CarritoCard(this._prd,this.mapa);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_prd.imagen),
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 25),
            Expanded(child: Text('${_prd.nombre}')),
            IconButton(
              icon: Icon(CupertinoIcons.add, color: Colors.greenAccent[700]),
              onPressed: () => BlocProvider.of<CarritoBloc>(context)
                  .add(AgregarCarro(product: _prd)),
            ),
            Text('${mapa[_prd].toString()}'),
            IconButton(
              icon: Icon(CupertinoIcons.trash, color: Colors.redAccent[700]),
              onPressed: () => BlocProvider.of<CarritoBloc>(context)
                  .add(EliminarCarro(product: _prd)),
            )
          ],
        ),
      ),
    );
  }
}
