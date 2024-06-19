class ImageEntity {
  String id;
  String title;
  String pathIn;
  String? pathOut;
  String? format;

  ImageEntity(
      {required this.id,
      required this.title,
      required this.pathIn,
      this.pathOut,
      this.format});
}
