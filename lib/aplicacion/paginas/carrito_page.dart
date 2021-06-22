import 'package:carro_compras/aplicacion/widgets/botom_custom.dart';
import 'package:carro_compras/aplicacion/widgets/carrito_card.dart';
import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_bloc.dart';
import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_event.dart';
import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_states.dart';
import 'package:carro_compras/dominio/modelos/productos_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/* Clase que contiene el  Carrito de Compras  de la aplicacion*/

class CarritoCompras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarritoBloc, BlocState>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.lightBlueAccent,
                title: Text('Mis productos ',
                    style: TextStyle(color: Colors.white)),
                actions: [
                  BlocProvider.of<CarritoBloc>(context).carroProductos.length >
                          0
                      ? IconButton(
                          icon: Icon(CupertinoIcons.trash,
                              color: Colors.redAccent[700]),
                          onPressed: () => BlocProvider.of<CarritoBloc>(context)
                              .add(VaciarCarro()),
                        )
                      : Container()
                ],
              ),
              body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Card(
                          color: Colors.lightBlueAccent,
                          elevation: 12,
                          child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Total Productos: ${BlocProvider.of<CarritoBloc>(context).carroProductos.length}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: BlocProvider.of<CarritoBloc>(context)
                                  .carroProductos
                                  .length,
                              itemBuilder: (context, idx) {
                                List<Productos> list = [];
                                Map<Productos, int> mapa =
                                    BlocProvider.of<CarritoBloc>(context)
                                        .carroProductos;
                                mapa.forEach((k, v) => list.add(k));
                                Productos _prd = list[idx];
                                return CarritoCard(_prd, mapa);
                              }),
                        ),
                        BlocProvider.of<CarritoBloc>(context)
                                    .carroProductos
                                    .length >
                                0
                            ? BotonCustom(colors: [
                                Color(0xFF19AEFF),
                                Color(0xFF139DF7),
                                Color(0xFF0A83EE),
                                Color(0xFF0570E5),
                                Color(0xFF0064E0)
                              ], hintText: 'Pagar', onPressed: () {})
                            : Container()
                      ],
                    )),
              ),
            ));
  }
}

