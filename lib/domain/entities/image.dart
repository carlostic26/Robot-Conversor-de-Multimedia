class Image {
  String id;
  String title;
  String pathIn;
  String? pathOut;
  String? format;

  Image(
      {required this.id,
      required this.title,
      required this.pathIn,
      this.pathOut,
      this.format});
}
