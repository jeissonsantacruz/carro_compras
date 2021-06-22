import 'package:carro_compras/aplicacion/widgets/producto_card.dart';
import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_bloc.dart';
import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_states.dart';
import 'package:carro_compras/arquitectura/bloc/productosBloc/productos_bloc.dart';
import 'package:carro_compras/arquitectura/servicios/productos_repositorio.dart';
import 'package:carro_compras/dominio/modelos/productos_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'carrito_page.dart';

/* Clase que contiene el Home Page de la aplicacion dodne se muestran todos los productos */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductosRepository _productoRepository = ProductosRepository();
  List<Productos> postList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductosBloc>(
        create: (context) =>
            ProductosBloc(productosRepository: _productoRepository)
              ..add(CargarProductos()),
        child: Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.lightBlueAccent,
              title: Text('Carrito de compras',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              leading: IconButton(
                icon: Stack(
                  children: [
                    Align(
                      child: Icon(CupertinoIcons.shopping_cart,
                          color: Colors.black),
                      alignment: Alignment.centerLeft,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 10,
                          child: BlocBuilder<CarritoBloc, BlocState>(
                              builder: (context, state) => Text(
                                  '${BlocProvider.of<CarritoBloc>(context).carroProductos.length}',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold))),
                          backgroundColor: Colors.red,
                        ))
                  ],
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CarritoCompras())),
              ),
            ),
            body: BlocBuilder<ProductosBloc, ProductoState>(
                builder: (context, state) {
              if (state is ProductoCargando) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductoNoCargado) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.error),
                      Text('No se pudo cargar los productos')
                    ],
                  ),
                );
              }
              if (state is ProductoCargado) {
                postList = state.productos;
                return Container(
                    child: postList.length == 0
                        ? Center(
                            child: Text('Productos No Disponibles'),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: postList.length,
                              itemBuilder: (_, index) {
                                return CardProdcuto(postList[index]);
                              },
                            ),
                          ));
              }
              return Container();
            })));
  }
}
