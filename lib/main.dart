import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'aplicacion/home_page.dart';
import 'arquitectura/preferencias/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final PreferenciasUsuario preferenciasUsuario = new PreferenciasUsuario();
  await preferenciasUsuario.initPrefs();
  Firebase.initializeApp().then((value) => 
  runApp(MyApp()));
  
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
 
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute:  '/homeVehiculos',
            navigatorKey: navigatorKey,
            routes: {
              '/homeVehiculos': (context) => HomePage()
            },
          );
  }
}





