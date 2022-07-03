class RestoModel {
  final String id;
  final String name;
  final String alamat;
  final String imageUrl;

  RestoModel({
    this.id = '',
    this.name = '',
    this.alamat = '',
    this.imageUrl = '',
  });

  factory RestoModel.fromJson(String id, Map<String, dynamic> json) =>
      RestoModel(
        id: id.toString(),
        name: json['name'],
        alamat: json['alamat'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alamat': alamat,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        alamat,
        imageUrl,
      ];
}
