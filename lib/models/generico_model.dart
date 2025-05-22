import 'package:app2025v2/models/estilo_model.dart';
import 'package:app2025v2/models/producto_model.dart';
import 'package:app2025v2/models/promocion_model.dart';

class GenericoModel {
  int id;
  String nombre;
  List<String> fotos;
  int? valoracion;
  int? precio;
  int? descuento;
  EstiloModel estilo;
  String? detalles;
  String? nombre_sub;
  int cantidad;
  String tipo;

  GenericoModel(
      {required this.id,
      required this.nombre,
      required this.fotos,
      this.valoracion,
      required this.precio,
      required this.descuento,
      this.detalles,
      required this.estilo,
      this.cantidad = 1,
      this.nombre_sub,
      this.tipo = "producto"});

  factory GenericoModel.fromProducto(ProductoModel p) => GenericoModel(
        id: p.id,
        nombre: p.nombre,
        fotos: p.fotos,
        precio: p.precio,
        descuento: p.descuento,
        estilo: p.estilo,
        tipo: "producto",
      );

  factory GenericoModel.fromPromocion(PromocionModel p) => GenericoModel(
        id: p.id,
        nombre: p.nombre,
        fotos: p.fotos,
        precio: p.precio,
        descuento: p.descuento,
        estilo: p.estilo,
        tipo: "promocion",
      );
}
