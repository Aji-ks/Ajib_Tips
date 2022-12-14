class TipsModel {
  final String name , sekilas, deskripsi, img_url;
  TipsModel({
    required this.name,
    required this.sekilas,
    required this.deskripsi,
    required this.img_url,
  });

  factory TipsModel.fromJSON(Map parsedJson) {
    return TipsModel(
      name: parsedJson['name'],
      sekilas: parsedJson['sekilas'],
      deskripsi: parsedJson['deskripsi'],
      img_url: parsedJson['img_url'],
    );
  }
}