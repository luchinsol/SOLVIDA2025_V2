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

  Future<void> postPedido({
    int? clienteId,
    required String fecha,
    required String estado,
    required String observacion,
    required String tipoPago,
    int? ubicacionId,
    int? cuponId,
    required int deliveryId,
    int? codigoId,
    required double total,
    required List<Map<String, dynamic>> detalles,
  }) async {
    try {
      final url = Uri.parse("$microUrl/pedido");
      final body = jsonEncode({
        "cliente_id": clienteId,
        "fecha": fecha,
        "estado": estado,
        "observacion": observacion,
        "tipo_pago": tipoPago,
        "ubicacion_id": ubicacionId,
        "cupon_id": cuponId,
        "delivery_id": deliveryId,
        "codigo_id": codigoId,
        "total": total,
        "detalles": detalles,
      });

      final res = await http.post(
        url,
        body: body,
        headers: {"Content-type": "application/json"},
      );

      if (res.statusCode == 201) {
        final data = jsonDecode(res.body);
        print("....data PEDIDO POSTEADA");
        print(data);
        // Aquí puedes parsear `data` a tu modelo PedidoModel si quieres
        // _pedido = PedidoModel.fromJson(data);
        notifyListeners();
      } else {
        print("Error al crear pedido: ${res.body}");
      }
    } catch (e) {
      print("Error en la petición $e");
    }
  }
}
