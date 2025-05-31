import 'dart:convert';

import 'package:app2025v2/models/ubicacion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UbicacionProvider extends ChangeNotifier {
  // ATRIBUTOS
  List<UbicacionModel> _ubicaciones = [];
  List<UbicacionModel> get allubicaciones => _ubicaciones;
  String microUrl = dotenv.env['MICRO_URL'] ?? '';
  UbicacionModel? _ubicacionTemp;
  UbicacionModel? get getUbicaiontemp => _ubicacionTemp;
  bool get isEditing => _ubicacionTemp?.id != null;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int? _idSeleccionado;
  int? get idSeleccionado => _idSeleccionado;
  bool _dentrodelarea = false;
  bool get dentrodeArea => _dentrodelarea;

  Future<void> seleccionarUbicacion(int id) async {
    _idSeleccionado = id;

    print("....seleccionar ubicacion");
    print("id $id");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('ubicacionSeleccionada', id);
    notifyListeners();
    // Automáticamente verificar si está fuera de la zona
    await verificacionUbicacionSeleccionada(id);
  }

  Future<void> verificacionUbicacionSeleccionada(int idUbicacion) async {
    try {
      if (idUbicacion == 57) {
        _dentrodelarea = true;
        notifyListeners();
        print("---Estas dentro");
      } else {
        _dentrodelarea = false;
        notifyListeners();
        print("...Estas FUERA");
      }
    } catch (e) {}
  }

  Future<void> cargarUbicacionSeleccionada() async {
    final prefs = await SharedPreferences.getInstance();
    _idSeleccionado = prefs.getInt('ubicacionSeleccionada');
    notifyListeners();
  }

  // MÉTODOS

  Future<void> postNewUbicacion(
      {required String? distrito,
      required String? direccion,
      required String? etiqueta,
      required double? latitud,
      required double? longitud,
      required int? cliente_id}) async {
    try {
      print("..........dentro del POST PROVIDER");
      print(distrito);
      print(direccion);
      var res = await http.post(Uri.parse("$microUrl/ubicacion_cliente"),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "distrito": distrito,
            "direccion": direccion,
            "latitud": latitud,
            "longitud": longitud,
            "cliente_id": cliente_id,
            "etiqueta": etiqueta
          }));
      if (res.statusCode == 201) {
        var data = jsonDecode(res.body);
        print(".....DATA POST");
        UbicacionModel nuevaUbicacion = UbicacionModel.fromJson(data);
        _ubicaciones.add(nuevaUbicacion);

        await seleccionarUbicacion(nuevaUbicacion.id!);
        print(data);
        notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      throw Exception("Error en la petición: $e");
    }
  }
/*
UbicacionModel? get getUbicacionSeleccionada {
  if (_idSeleccionado == null) return null;
  return _ubicaciones.firstWhere(
    (u) => u.id == _idSeleccionado,
    orElse: () => null,
  );
}*/

  Future<void> ubicacionSeleccionada(int id) async {
    try {
      var res = await http.post(
        Uri.parse('$microUrl/ubicacion_seleccionada/$id'),
      );
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
      }
    } catch (e) {
      throw Exception("Error en la petición: $e");
    }
  }

  Future<void> getUbicaciones(int? cliente_id) async {
    print("...Ubicaciones....");
    _isLoading = true;
    notifyListeners();
    try {
      var res =
          await http.get(Uri.parse('$microUrl/allubicaciones/$cliente_id'));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        _ubicaciones = List<UbicacionModel>.from(
            data.map((item) => UbicacionModel.fromJson(item)));
        print("Hay ubicaciones");
        /* if (_ubicaciones.isNotEmpty && _idSeleccionado == null) {
          _idSeleccionado = _ubicaciones.last.id;
          print(
              "No había selección previa, se eligió por defecto: $_idSeleccionado");
        }*/
        notifyListeners();
      }

      notifyListeners();
    } catch (e) {
      _ubicaciones = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setTemporal(UbicacionModel? ubicaciontemp) {
    _ubicacionTemp = ubicaciontemp;
    print("------TIENE ID =");
    print(ubicaciontemp?.id);
    notifyListeners();
  }

  void clear() {
    _ubicacionTemp = null;
    notifyListeners();
  }

  void limpiarUbicaciones() {
    _ubicaciones = [];
    _idSeleccionado = null;
    _dentrodelarea = false;
    _ubicacionTemp = null;
    notifyListeners();
  }
}
