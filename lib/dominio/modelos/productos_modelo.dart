import 'package:cloud_firestore/cloud_firestore.dart';

/* Esta clase contiene el modelo del producto directamente de firebase */
class Productos {
  final String nombre, sku, descripcion, precio, imagen, id;

  const Productos(this.nombre, this.sku, this.descripcion, this.precio,
      this.imagen, this.id);

  static Productos fromSnapshot(DocumentSnapshot snapshot) {
    return Productos(
        snapshot.data['nombre'],
        snapshot.data['sku'],
        snapshot.data['descripcion'],
        snapshot.data['precio'],
        snapshot.data['imagen'],
        snapshot.documentID);
  }
}
