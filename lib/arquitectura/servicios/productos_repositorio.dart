import 'package:carro_compras/dominio/modelos/productos_modelo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductosRepository {
  final databaseReference = Firestore.instance;

  Stream<List<Productos>> getPosts() {
    return databaseReference.collection("productos").snapshots()
      .map((snapshot) {
        return snapshot.documents.map((doc) => Productos.fromSnapshot(doc)).toList();
      });
  }
}