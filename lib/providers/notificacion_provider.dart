import 'dart:convert';

import 'package:app2025v2/models/notificaciones_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotificacionProvider extends ChangeNotifier {
  List<NotificacionesModel>? _notificaciones;
  List<NotificacionesModel>? get allnotifycliente => _notificaciones;
  String microUrl = dotenv.env['MICRO_URL'] ?? '';

  bool _leido = false;

  bool get yaLeido => _leido;

  Future<void> cargarEstadoLeido() async {
    final prefs = await SharedPreferences.getInstance();
    _leido = prefs.getBool('notificaciones_leido') ?? false;
    notifyListeners();
  }

  Future<void> marcarComoLeido() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificaciones_leido', true);
    _leido = true;
    notifyListeners();
  }

  Future<void> getNotificaciones() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var res = await http.get(Uri.parse("$microUrl/notificacion_cliente"));
      if (res.statusCode == 200) {
        print(".....entro a notificacion");
        var data = jsonDecode(res.body);
        _notificaciones =
            (data as List).map((e) => NotificacionesModel.fromJson(e)).toList();
        // Si llegaron nuevas notificaciones, marcar como no leído
        if (_notificaciones!.isNotEmpty) {
          await prefs.setBool('notificaciones_leido', false);
          _leido = false;
        }
        notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      print("Error en la petición $e");
    }
  }
}
