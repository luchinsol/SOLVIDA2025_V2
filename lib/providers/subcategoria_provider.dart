import 'dart:convert';

import 'package:app2025v2/models/generico_model.dart';
import 'package:app2025v2/models/subcategoria_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SubcategoriaProvider extends ChangeNotifier {
  // ATRIBUTOS
  SubcategoriaModel? _subcategoria;
  SubcategoriaModel? get allproductossubcategoria => _subcategoria;
  String microurl = dotenv.env['MICRO_URL'] ?? '';
  String _filtro = 'Todos'; // Nuevo estado
  String get filtroActual => _filtro;
  List<GenericoModel> get allItemsGenerico {
    if (_subcategoria == null) return [];
    return [
      ..._subcategoria!.productos.map((p) => GenericoModel.fromProducto(p)),
      ..._subcategoria!.promociones.map((p) => GenericoModel.fromPromocion(p)),
    ];
  }

  List<GenericoModel> get itemsFiltrados {
    if (_filtro == 'Todos') return allItemsGenerico;
    return allItemsGenerico
        .where((item) => item.tipo.toLowerCase() == _filtro.toLowerCase())
        .toList();
  }

  void filtrarTipo(String tipo) {
    // Asegura valores compatibles
    if (tipo == 'Productos') {
      _filtro = 'producto';
    } else if (tipo == 'Promos') {
      _filtro = 'promocion';
    } else {
      _filtro = 'Todos';
    }
    notifyListeners();
  }

  // MÉTODOS
  Future<void> getSubcategoria(int id) async {
    try {
      // 1 => sub / 1 => ubicacion
      var res = await http
          .get(Uri.parse('$microurl/all_subcategoria_productos/${id}/1'));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        _subcategoria = SubcategoriaModel.fromJson(data);
        print("dentro del subcategoria provider");
        print("${_subcategoria?.nombre}");
        notifyListeners();
      }
    } catch (e) {
      print("$e");
    }
  }
}
