import 'dart:convert';

import 'package:app2025v2/models/pedido_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PedidoProvider extends ChangeNotifier {
  PedidoModel? _pedido;
  PedidoModel? get allpedidos => _pedido;
  List<PedidoModel>? _pedidoshoy = [];
  List<PedidoModel>? get allpedidoshoy => _pedidoshoy;

  String microUrl = dotenv.env['MICRO_URL'] ?? '';

  Future<void> postPedido() async {
    try {
      var res = await http.post(Uri.parse("$microUrl/pedido"),
          body: jsonEncode({}), headers: {"Content-type": "application/json"});
      if (res.statusCode == 201) {
        var data = jsonDecode(res.body);
        //  _pedido = 0;
        notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      print("Error en la petición $e");
    }
  }
}
