class Audio {
  String id;
  String title;
  String duration; //elegir formato segundos o minuto, quitar string
  String pathIn;
  String? pathOut;
  String? format;

  Audio(
      {required this.id,
      required this.title,
      required this.duration,
      required this.pathIn,
      this.pathOut,
      this.format});
}
