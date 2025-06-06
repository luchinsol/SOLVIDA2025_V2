import 'dart:convert';

import 'package:app2025v2/models/pedido_model.dart';
import 'package:app2025v2/models/producto_model.dart';
import 'package:app2025v2/models/promocion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CarritoProvider extends ChangeNotifier {
  int get totalItems => _productoN.length + _promociones.length;
  List<ProductoModel> _productoN = [];
  List<PromocionModel> _promociones = [];
  List<dynamic> get itemsCombinados => [..._productoN, ..._promociones];
  List<DetallePedido> _detallesPedido = [];
  List<DetallePedido> get detallesPedido => _detallesPedido;
  int idProductotemp = 0;
  int idPromotemp = 0;
  double sumatotalPedido = 0;
  String microUrl = dotenv.env['MICRO_URL'] ?? '';

  Future<void> postCalificacion(
      int? cliente, dynamic item, int idgenerico, double? calificacion) async {
    try {
      final body = {
        "cliente_id": cliente,
        "calificacion": calificacion ?? 0,
      };

      print("...BODY $cliente $item $idgenerico $calificacion");
      // Detecta si es producto o promoción por tipo de modelo
      if (item is ProductoModel) {
        print("...soy producto");
        body["producto_id"] = idgenerico;
      } else if (item is PromocionModel) {
        print("soo prpomoooo");
        body["promocion_id"] = idgenerico;
      } else {
        print("Tipo de item no reconocido");
        return;
      }
      print("body nuevo $body");
      var res = await http.post(
        Uri.parse("$microUrl/calificacion"),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(body),
      );

      if (res.statusCode == 201) {
        var data = jsonDecode(res.body);
        print(".....CALIFICACIÓN REGISTRADA");
        print(data);
        notifyListeners();
      } else {
        print("Error al registrar calificación: ${res.body}");
      }
      notifyListeners();
    } catch (e) {
      print("Error en la petición: $e");
    }
  }

  void agregarProducto(dynamic producto) {
    if (producto is ProductoModel) {
      final yaExiste = _productoN.any((p) => p.id == producto.id);
      if (!yaExiste) {
        _productoN.add(producto);
        _detallesPedido.add(DetallePedido(
            productoId: producto.id!,
            cantidad: producto.cantidad,
            promocionId: null));
        print("---PRODUCTO AGREGADO---");
      } else {
        print("---PRODUCTO YA EXISTE, NO SE AGREGA---");
      }
    } else if (producto is PromocionModel) {
      final yaExiste = _promociones.any((p) => p.id == producto.id);
      if (!yaExiste) {
        _promociones.add(producto);
        _detallesPedido.add(DetallePedido(
            productoId:
                null, // NECESITO QUE BUSQUES EN EL BACKEND POR LA PROMO ID
            cantidad: producto.cantidad,
            promocionId: producto.id));

        print("---PROMOCIÓN AGREGADA---");
      } else {
        print("---PROMOCIÓN YA EXISTE, NO SE AGREGA---");
      }
    }
    subtotal();
    notifyListeners();
  }

  void mostrarProducto(dynamic item) {
    print("---------");
    print("${item.nombre}");
    print("---------");
  }

  void subtotal() {
    sumatotalPedido = 0;

    for (var item in _productoN) {
      sumatotalPedido += (item.precio ?? 0) * item.cantidad;
    }

    for (var item in _promociones) {
      sumatotalPedido += (item.precio ?? 0) * item.cantidad;
    }

    notifyListeners();
  }

  void mostrar() {
    print("$totalItems");
  }

  void incrementar(int index) {
    final item = itemsCombinados[index];

    if (item is ProductoModel) {
      final i = _productoN.indexWhere((p) => p.id == item.id);
      if (i != -1) _productoN[i].cantidad++;
    } else if (item is PromocionModel) {
      final i = _promociones.indexWhere((p) => p.id == item.id);
      if (i != -1) _promociones[i].cantidad++;
    }

    subtotal();
    notifyListeners();
  }

  void decrementar(int index) {
    final item = itemsCombinados[index];

    if (item is ProductoModel) {
      final i = _productoN.indexWhere((p) => p.id == item.id);
      if (i != -1) {
        _productoN[i].cantidad--;
        if (_productoN[i].cantidad <= 0) {
          _productoN.removeAt(i);
        }
      }
    } else if (item is PromocionModel) {
      final i = _promociones.indexWhere((p) => p.id == item.id);
      if (i != -1) {
        _promociones[i].cantidad--;
        if (_promociones[i].cantidad <= 0) {
          _promociones.removeAt(i);
        }
      }
    }

    subtotal();
    notifyListeners();
  }

  void deleteCarrito() {
    _productoN.clear();
    _promociones.clear();
    notifyListeners();
  }

  void deleteProducto(int index) {
    final item = itemsCombinados[index];
    if (item is ProductoModel) {
      _productoN.removeWhere((p) => p.id == item.id);
    } else if (item is PromocionModel) {
      _promociones.removeWhere((p) => p.id == item.id);
    }

    subtotal();
    notifyListeners();
  }
}
