class UbicacionSeleccionadaModel {
  int? id;
  String? departamento;
  String? provincia;
  String distrito;
  String direccion;
  double latitud;
  double longitud;
  int clienteId;
  String etiqueta;

  UbicacionSeleccionadaModel({
    required this.id,
    this.departamento,
    this.provincia,
    required this.distrito,
    required this.direccion,
    required this.latitud,
    required this.longitud,
    required this.clienteId,
    required this.etiqueta,
  });

  factory UbicacionSeleccionadaModel.fromJson(Map<String, dynamic> json) {
    return UbicacionSeleccionadaModel(
      id: json['id'],
      departamento: json['departamento'],
      provincia: json['provincia'],
      distrito: json['distrito'],
      direccion: json['direccion'],
      latitud: double.parse(json['latitud'].toString()),
      longitud: double.parse(json['longitud'].toString()),
      clienteId: json['cliente_id'],
      etiqueta: json['etiqueta'],
    );
  }
}
