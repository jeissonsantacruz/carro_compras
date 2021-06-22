import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'aplicacion/paginas/home_page.dart';
import 'arquitectura/bloc/carritoBloc/carrito_bloc.dart';
import 'arquitectura/bloc/productosBloc/productos_bloc.dart';
import 'arquitectura/servicios/productos_repositorio.dart';



void main() =>  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<CarritoBloc>(
              create: (context) =>
                  CarritoBloc(),
            ),
            BlocProvider<ProductosBloc>(create: (context) => ProductosBloc(productosRepository: ProductosRepository()),)

          ],
          child: MyApp()
      )
  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}





