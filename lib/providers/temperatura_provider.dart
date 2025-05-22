import 'dart:convert';

import 'package:app2025v2/models/temperatura_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TemperaturaProvider extends ChangeNotifier {
  //ATRIBUTOS
  TemperaturaModel? _temperatura;
  TemperaturaModel? get temptoday => _temperatura;
  String tempApi = dotenv.env['API_OPENWEATHER'] ?? '';
  String keytemp = dotenv.env['API_KEYWEATHER'] ?? '';
  String ciudad = "Arequipa";
  //MÉTODOS
  Future<void> getTemperatura() async {
    try {
      var res = await http.get(Uri.parse('${tempApi}q=$ciudad&appid=$keytemp'));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print("..........data temp");
        print(data);
        //_temperatura = TemperaturaModel.fromJson(data);
        // print("temperatura $_temperatura");
        notifyListeners();
      }
    } catch (e) {
      print("$e");
    }
  }
}
