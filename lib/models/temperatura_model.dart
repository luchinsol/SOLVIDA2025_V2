class TemperaturaModel {
  int id;
  double temperatura;

  // CONSTRUCTOR
  TemperaturaModel({required this.id, required this.temperatura});
  factory TemperaturaModel.fromJson(Map<String, dynamic> json) {
    return TemperaturaModel(id: json['id'], temperatura: json['temperatura']);
  }
}
