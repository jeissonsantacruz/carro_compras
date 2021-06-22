import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_bloc.dart';
import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_event.dart';
import 'package:carro_compras/dominio/modelos/productos_modelo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Clase que contiene una tarjeta customizada para mostar los productos */
class CardProdcuto extends StatelessWidget {
  final Productos prod;
  CardProdcuto(this.prod);

  @override
  Widget build(BuildContext context) {
    // Data server Url
    final size = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
          _onTap(context);
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _DescripcionCard(prod),
                ],
              ),
              Positioned(
                  top: size.height * 0.0,
                  bottom: size.height * 0.11,
                  child: Image.network(prod.imagen,
                      height: size.height * 0.3, width: size.width * 0.4))
            ],
          ),
        ));
  }

  _onTap(context) {}
}

class _DescripcionCard extends StatelessWidget {
  final Productos prod;

  _DescripcionCard(this.prod);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return new GestureDetector(
        onTap: () => BlocProvider.of<CarritoBloc>(context)
            .add(AgregarCarro(product: prod)),
        child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: size.width > size.height
                  ? size.height * 0.40
                  : size.height * 0.28, 
              height: size.height,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        Text('${prod.nombre}',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w800)),
                        Spacer(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Text(
                          ' \$ ' + '${prod.precio}',
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500),
                        ),
                        width: size.width > size.height
                            ? size.width * 0.2
                            : size.width * 0.17,
                        //height: size.height*0.05,
                      ),
                      Container(
                        child: RaisedButton(
                            color: Colors.black,
                            child: Text('Añadir ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () =>
                                BlocProvider.of<CarritoBloc>(context)
                                    .add(AgregarCarro(product: prod))),
                        width: 100.0,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
