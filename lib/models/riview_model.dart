class RiviewModel {
  final String id;
  final String idResto;
  final String name;
  final String teks;

  RiviewModel({
    this.id = '',
    this.idResto = '',
    this.name = '',
    this.teks = '',
  });

  factory RiviewModel.fromJson(String id, Map<String, dynamic> json) =>
      RiviewModel(
        id: id.toString(),
        idResto: json['idResto'],
        name: json['name'],
        teks: json['teks'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idResto': idResto,
      'name': name,
      'teks': teks,
    };
  }

  @override
  List<Object?> get props => [
        id,
        idResto,
        name,
        teks,
      ];
}
