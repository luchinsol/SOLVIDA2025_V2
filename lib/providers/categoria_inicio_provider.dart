import 'dart:convert';

import 'package:app2025v2/models/categoria_inicio_model.dart';
import 'package:app2025v2/models/categoria_model.dart';
import 'package:app2025v2/providers/ubicacion_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CategoriaInicioProvider extends ChangeNotifier {
  String microurl = dotenv.env['MICRO_URL'] ?? '';

  CategoriaSubcategoriaModel? _categoriaSubcategoriaModel;

  CategoriaSubcategoriaModel? get allcategoria_subcategoria =>
      _categoriaSubcategoriaModel;

  Future<void> getCategoriaSubcategoria(int? id, int ubicacionClienteId) async {
    try {
      _categoriaSubcategoriaModel = null;
      notifyListeners();
      print("....SE CARGA EL HOME CON LA CATEGORIA ESCOGIDA");
      // SUBCATEGORÍA POR DEFECTO ARRANCA EN EL AGUA
      final categoriaId = id ?? 1;
      var res = await http.get(Uri.parse(
          '$microurl/categoria/${categoriaId}/${ubicacionClienteId}'));
      if (res.statusCode == 200) {
        print("....CAT CAT ${res.body}");
        var data = jsonDecode(res.body);
        _categoriaSubcategoriaModel = CategoriaSubcategoriaModel.fromJson(data);
        print("//////// -------- CAT --------- //////////");
        print(data);
        notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      throw Exception("Error query $e");
    }
  }

  void limpiarCategoriaSubModel() {
    _categoriaSubcategoriaModel = null;
  }

  void setCategoriaSubcategoria(CategoriaSubcategoriaModel model) {
    _categoriaSubcategoriaModel = model;
    notifyListeners();
  }
}
