class UbicacionList {
  String? etiqueta;
  String? direccion;
  String? distrito;

  UbicacionList({
    this.direccion,
    this.distrito,
    this.etiqueta,
  });

  factory UbicacionList.fromJson(Map<String, dynamic> json) {
    return UbicacionList(
      etiqueta: json['etiqueta'],
      direccion: json['direccion'],
      distrito: json['distrito'],
    );
  }
}
