import 'package:app2025v2/models/generico_model.dart';
import 'package:flutter/material.dart';

class GenericoProvider extends ChangeNotifier {
  // ATRIBUTOS
  GenericoModel? _productogenerico;

  GenericoModel? get allGenericos => _productogenerico;

  void setGenerico(dynamic item, String subnombre) {
    _productogenerico = GenericoModel(
        id: item.id,
        nombre: item.nombre,
        fotos: item.fotos,
        valoracion: item.valoracion,
        precio: item.precio,
        descuento: item.descuento,
        nombre_sub: subnombre,
        // detalles: detalles,
        estilo: item.estilo);
    notifyListeners();
  }
}
