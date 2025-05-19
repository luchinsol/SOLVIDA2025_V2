import 'dart:convert';
import 'package:app2025v2/models/categoria_model.dart';
import 'package:app2025v2/models/lista_ubicacion_model.dart';
import 'package:app2025v2/models/ubicacion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UbicacionProvider extends ChangeNotifier {
  String microurl = dotenv.env['MICRO_URL'] ?? '';
  int? _ubicacionId;

  int? get ubicacionId => _ubicacionId;

  //LISTADO DE UBICACIONES
  List<UbicacionList> _ubicaciones = [];

  List<UbicacionList> get ubicaciones => _ubicaciones;

  Future<void> registrarUbicacion({
    String? departamento,
    String? distrito,
    String? direccion,
    String? numeroMzLote,
    String? etiqueta,
    String? latitud,
    String? longitud,
    int? clienteId,
  }) async {
    try {
      // Combinar dirección con número/mz/lote para el campo dirección
      String direccionCompleta = "$direccion $numeroMzLote";

      final Map<String, dynamic> data = {
        "departamento": departamento,
        "distrito": distrito,
        "direccion": direccionCompleta,
        "latitud": latitud,
        "longitud": longitud,
        "cliente_id": clienteId,
        "etiqueta": etiqueta
      };

      final response = await http.post(
        Uri.parse(microurl + '/ubicacion_cliente'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        _ubicacionId = responseData['id'];
        notifyListeners();
        print("Ubicacion Ingresada Exitosamente");
      }
    } catch (e) {
      throw Exception("Error de query $e");
    }
  }

  Future<UbicacionSeleccionadaModel> obtenerUbicacionDetalle(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$microurl/ubicacion_seleccionada/$id'),
      );

      if (response.statusCode == 200) {
        return UbicacionSeleccionadaModel.fromJson(jsonDecode(response.body));
      }
      throw Exception('Error al obtener ubicación: ${response.statusCode}');
    } catch (e) {
      throw Exception("Error de conexión: $e");
    }
  }

  Future<void> actualizarUbicacion({
    int? ubicacionId,
    String? distrito,
    String? direccion,
    double? latitud,
    double? longitud,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "distrito": distrito,
        "direccion": direccion,
        "latitud": latitud,
        "longitud": longitud
      };

      final response = await http.put(
        Uri.parse('$microurl/actualizar_ubicacion/$ubicacionId'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print("Ubicación actualizada exitosamente");
      } else {
        print("Error al actualizar ubicación: ${response.statusCode}");
        throw Exception(
            "Error al actualizar ubicación: ${response.statusCode}");
      }
    } catch (e) {
      print("Error de conexión al actualizar ubicación: $e");
      throw Exception(e);
    }
  }

  Future<void> cargarUbicaciones(int clienteId) async {
    try {
      final response = await http.get(
        Uri.parse('$microurl/allubicaciones/$clienteId'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _ubicaciones =
            data.map((json) => UbicacionList.fromJson(json)).toList();
        notifyListeners();
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
