class Video {
  final String id;
  final String title;
  final String thunbnailUrl;
  final String channelTitle;

  Video({this.id, this.title, this.thunbnailUrl, this.channelTitle});

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return Video(
        id: snippet['resourceId']['videoId'],
        title: snippet['title'],
        thunbnailUrl: snippet['thumbnails']['high']['url'],
        channelTitle: snippet['channelTitle']);
  }
}
