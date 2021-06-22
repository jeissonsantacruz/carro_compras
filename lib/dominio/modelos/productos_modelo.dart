import 'package:cloud_firestore/cloud_firestore.dart';

class Productos {
  final String nombre, sku, descripcion, id;

  const Productos(this.nombre, this.sku, this.descripcion, this.id);

  static Productos fromSnapshot(DocumentSnapshot snapshot) {
    return Productos(snapshot.data['nombre'], snapshot.data['sku'],
        snapshot.data['descripcion'], snapshot.documentID);
  }
}
