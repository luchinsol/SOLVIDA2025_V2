class CategoriaModel {
  // Atributos
  int id;
  String nombre;

// Constructor
  CategoriaModel({required this.id, required this.nombre});

  factory CategoriaModel.fromJson(Map<String, dynamic> json) {
    return CategoriaModel(
      id: json['id'],
      nombre: json['nombre'],
    );
  }
}
