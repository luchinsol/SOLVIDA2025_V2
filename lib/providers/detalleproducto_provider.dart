import 'package:app2025v2/models/producto_model.dart';
import 'package:flutter/material.dart';

class DetalleProductoProvider extends ChangeNotifier {
  dynamic _item;

  dynamic get item => _item;

  void cargar(dynamic producto) {
    _item = producto;
    notifyListeners();
  }
}
