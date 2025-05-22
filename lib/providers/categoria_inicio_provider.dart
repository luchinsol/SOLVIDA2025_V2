import 'dart:convert';

import 'package:app2025v2/models/categoria_inicio_model.dart';
import 'package:app2025v2/models/categoria_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CategoriaInicioProvider extends ChangeNotifier {
  String microurl = dotenv.env['MICRO_URL'] ?? '';

  CategoriaSubcategoriaModel? _categoriaSubcategoriaModel;

  CategoriaSubcategoriaModel? get allcategoria_subcategoria =>
      _categoriaSubcategoriaModel;

  Future<void> getCategoriaSubcategoria(int? id) async {
    try {
      final subcategoriaId = id ?? 1;
      var res =
          await http.get(Uri.parse('$microurl/categoria/${subcategoriaId}/1'));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        _categoriaSubcategoriaModel = CategoriaSubcategoriaModel.fromJson(data);
        print("//////// -------- CAT --------- //////////");
        print(data);
        notifyListeners();
      }
    } catch (e) {
      throw Exception("Error query $e");
    }
  }
}
