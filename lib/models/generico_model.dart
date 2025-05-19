import 'package:app2025v2/models/estilo_model.dart';

class GenericoModel {
  int id;
  String nombre;
  List<String> fotos;
  int? valoracion;
  int precio;
  int descuento;
  EstiloModel estilo;
  String? detalles;
  String nombre_sub;

  GenericoModel(
      {required this.id,
      required this.nombre,
      required this.fotos,
      this.valoracion,
      required this.precio,
      required this.descuento,
      this.detalles,
      required this.estilo,
      required this.nombre_sub});
}
