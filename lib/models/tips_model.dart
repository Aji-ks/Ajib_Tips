class RamenModel {
  final String name , sekilas, deskripsi, img_url;
  RamenModel({
    required this.name,
    required this.sekilas,
    required this.deskripsi,
    required this.img_url,
  });

  factory RamenModel.fromJSON(Map parsedJson) {
    return RamenModel(
      name: parsedJson['name'],
      sekilas: parsedJson['sekilas'],
      deskripsi: parsedJson['deskripsi'],
      img_url: parsedJson['img_url'],
    );
  }
}