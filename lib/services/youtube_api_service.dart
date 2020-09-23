import 'dart:convert';
import 'dart:io';
import 'package:flutterTest/models/canale.dart';
import 'package:flutterTest/models/video.dart';
import 'package:flutterTest/utilities/keys.dart';
import 'package:http/http.dart' as http;

class APIService {
  APIService._instantiate();

  static final APIService instace = APIService._instantiate();

  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';

  Future<Channel> fetchChannel({String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': YOUYUBE_API,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      Channel canale = Channel.fromMap(data);
      canale.videos = await fetchVideoFromPlaylist(
        playlistId: canale.uploadPlaylistId,
      );
      return canale;
    } else {
      throw json.decode(response.body)['errore']['message'];
    }
  }

  Future<List<Video>> fetchVideoFromPlaylist({String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '8',
      'pageToken': _nextPageToken,
      'key': YOUYUBE_API,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      _nextPageToken = data['nextPageToken'] ?? '';

      List<dynamic> videosJson = data['items'];
      List<Video> listVideo = [];
      videosJson.forEach((element) {
        listVideo.add(Video.fromMap(element['snippet']));
      });

      return listVideo;
    } else {
      throw json.decode(response.body)['errore']['message'];
    }
  }
}
