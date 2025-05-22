import 'package:app2025v2/models/generico_model.dart';
import 'package:app2025v2/models/producto_model.dart';
import 'package:flutter/material.dart';

class CarritoProvider extends ChangeNotifier {
  List<GenericoModel> _productos = [];
  GenericoModel? productoGenerico;
  List<GenericoModel> get allProductos => _productos;
  int get totalItems => _productos.length;
  double sumatotalPedido = 0;

  // Funciones
  void agregarProducto(dynamic producto) {
    final tipo = producto is ProductoModel ? "producto" : "promocion";
    print("...tipo...${producto.id}");
    print(tipo);

    final index =
        _productos.indexWhere((p) => p.id == producto.id && p.tipo == tipo);
    if (index != -1) {
      _productos[index].cantidad += 1;
    } else {
      productoGenerico = GenericoModel(
          id: producto.id,
          nombre: producto.nombre,
          fotos: producto.fotos,
          precio: producto.precio,
          descuento: producto.descuento,
          estilo: producto.estilo,
          tipo: producto is ProductoModel ? "producto" : "promocion",
          cantidad: 1);
      //nombre_sub: producto.nombre_sub);
      _productos.add(productoGenerico!);
      mostrar();
    }
    subtotal();
    notifyListeners();
  }

  void mostrarProducto(dynamic item) {
    print("${item.nombre}");
  }

  void subtotal() {
    sumatotalPedido = _productos.fold(
        0, (suma, item) => suma + (item.precio! * item.cantidad));
    notifyListeners();
  }

  void mostrar() {
    print("$totalItems");
  }

  void incrementar(int index) {
    _productos[index].cantidad = _productos[index].cantidad + 1;
    subtotal();
    notifyListeners();
  }

  void decrementar(int index) {
    _productos[index].cantidad--;

    subtotal();
    notifyListeners();
  }

  void deleteCarrito() {
    _productos.clear();
    notifyListeners();
  }

  void deleteProducto(int index) {
    _productos.removeAt(index);
    subtotal();
    notifyListeners();
  }
}
