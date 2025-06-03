import 'package:app2025v2/models/cupon_model.dart';

class CuponCategoriaModel {
  int id;
  String nombre_categoria;
  List<CuponModel> cupones;

  CuponCategoriaModel(
      {required this.id,
      required this.nombre_categoria,
      required this.cupones});

  factory CuponCategoriaModel.fromJson(Map<String, dynamic> json) {
    return CuponCategoriaModel(
      id: json['id_categoria'],
      nombre_categoria: json['nombre_categoria'],
      cupones:
          (json['cupones'] as List).map((e) => CuponModel.fromJson(e)).toList(),
    );
  }
}
