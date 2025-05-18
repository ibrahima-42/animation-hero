class Track {
  final String title;
  final String preview;
  final String artist;
  final int duration;

  Track({
    required this.title,
    required this.preview,
    required this.artist,
    required this.duration,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      title: json['title'] ?? '',
      preview: json['preview'] ?? '',
      artist: json['artist']['name'] ?? '',
      duration: json['duration'] ?? 0,
    );
  }
}
