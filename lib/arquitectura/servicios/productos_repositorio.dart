import 'package:carro_compras/dominio/modelos/productos_modelo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/* Clase que contiene el post hacia firebase para obtener los productos */
class ProductosRepository {
  final databaseReference = Firestore.instance;

  Stream<List<Productos>> getPosts() {
    return databaseReference.collection("productos").snapshots()
      .map((snapshot) {
        return snapshot.documents.map((doc) => Productos.fromSnapshot(doc)).toList();
      });
  }
}