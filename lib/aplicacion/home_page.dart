import 'package:flutter/material.dart';

/* Clase que muestra el home con los productos de la aplicación */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        refresh();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Valet Parking App',
              style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          backgroundColor: Colors.orangeAccent,
          elevation: 0,
        ),
      ),
    );
  }

  refresh() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    Navigator.of(context).pop();
  }
}
