import 'package:app2025v2/models/estilo_model.dart';

class PromocionModel {
  int id;
  String nombre;
  List<String> fotos;
  int? valoracion;
  int precio;
  int descuento;
  EstiloModel estilo;
// CONSTRUCTOR
  PromocionModel(
      {required this.id,
      required this.nombre,
      required this.fotos,
      required this.valoracion,
      required this.precio,
      required this.descuento,
      required this.estilo});
  factory PromocionModel.fromJson(Map<String, dynamic> json) {
    return PromocionModel(
        id: json['id'],
        nombre: json['nombre'],
        fotos: List<String>.from(json['foto']),
        valoracion: json['valoracion'],
        precio: json['precio'],
        descuento: json['descuento'],
        estilo: EstiloModel.fromJson(json['estilo']));
  }
}
