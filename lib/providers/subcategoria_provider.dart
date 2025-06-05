import 'dart:convert';

import 'package:app2025v2/models/producto_model.dart';
import 'package:app2025v2/models/promocion_model.dart';
import 'package:app2025v2/models/subcategoria_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SubcategoriaProvider extends ChangeNotifier {
  // ATRIBUTOS
  SubcategoriaModel? _subcategoria;
  SubcategoriaModel? get allproductossubcategoria => _subcategoria;
  String microurl = dotenv.env['MICRO_URL'] ?? '';

/*  List<GenericoModel> get allItemsGenerico {
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
  }*/

  // MÉTODO DE SUBCATEGORIA ESPECIFICA SUB_ID, ZONA_ID
  Future<void> getSubcategoria(int id, int? zonatrabajoCliente) async {
    try {
      print(".....SUBCTEGORIA ESPECIFICA zona:$zonatrabajoCliente");
      // 1 => sub / 1 => ubicacion
      var res = await http.get(Uri.parse(
          '$microurl/all_categorias_subcategoria/${id}/${zonatrabajoCliente}'));
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
