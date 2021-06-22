
import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_event.dart';
import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_states.dart';
import 'package:carro_compras/arquitectura/bloc/productos_bloc.dart';
import 'package:carro_compras/arquitectura/servicios/productos_repositorio.dart';
import 'package:carro_compras/dominio/modelos/productos_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'carrito_page.dart';

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
            appBar: AppBar(
              title: Text('Shopping Cart'),
              leading: IconButton(
                icon: Stack(
                  children: [
                    Align(
                      child: Icon(CupertinoIcons.shopping_cart),
                      alignment: Alignment.centerLeft,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 10,
                          child: BlocBuilder<ProductBloc, BlocState>(
                              builder: (context, state) => Text(
                                  '${BlocProvider.of<ProductBloc>(context).cartProducts.length}',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold))),
                          backgroundColor: Colors.red,
                        ))
                  ],
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart())),
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
                        : ListView.builder(
                            itemCount: postList.length,
                            itemBuilder: (_, index) {
                              return postsUI(postList[index]);
                            },
                          ));
              }
              return Container();
            })));
  }

  Widget postsUI(Productos producto) {
    return Card(
        elevation: 10.0,
        margin: EdgeInsets.all(14.0),
        child: ListTile(
          title: Text(producto.nombre),
          subtitle: Text(producto.descripcion),
          trailing: IconButton(
              icon: Icon(CupertinoIcons.shopping_cart),
              onPressed: () => BlocProvider.of<ProductBloc>(context)
                  .add(AddToCart(product: producto))),
        ));
  }
}
