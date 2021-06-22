import 'package:carro_compras/arquitectura/bloc/carritoBloc/carrito_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'aplicacion/home_page.dart';
import 'arquitectura/bloc/productos_bloc.dart';
import 'arquitectura/servicios/productos_repositorio.dart';



void main() =>  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<ProductBloc>(
              create: (context) =>
                  ProductBloc(),
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
      title: "Bloc App II",
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}





