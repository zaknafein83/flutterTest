import 'package:flutter/material.dart';
import 'package:flutterTest/models/canale.dart';
import 'package:flutterTest/models/video.dart';
import 'package:flutterTest/schermate/videoScreen.dart';
import 'package:flutterTest/services/youtube_api_service.dart';
import 'package:flutterTest/utilities/keys.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyPostListPage(),
    );
  }
}

class MyPostListPage extends StatefulWidget {
  @override
  _MyPostListState createState() => _MyPostListState();
}

class _MyPostListState extends State<MyPostListPage> {
  Channel canale;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Canale Youtube'),
        ),
        body: canale != null
            ? NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (!_isLoading &&
                      canale.videos.length != int.parse(canale.videoCount) &&
                      notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent) {
                    _loadMoreVideos();
                  }
                },
                child: ListView.builder(
                    itemCount: 1 + canale.videos.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _buildProfile();
                      }
                      Video video = canale.videos[index - 1];
                      return _buildVideo(video);
                    }),
              )
            : Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ));
  }

  _initChannel() async {
    Channel channel =
        await APIService.instace.fetchChannel(channelId: CHANNEL_DS);
    setState(() {
      canale = channel;
    });
  }

  Widget _buildProfile() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 1),
          blurRadius: 6.0,
        )
      ]),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            backgroundImage: NetworkImage(canale.profilePictureUrl),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                canale.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${canale.subscriberCount} iscritti',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      // onTap: () => Navigator.popAndPushNamed(context, '/video',
      //     arguments: <String, String>{
      //       'id': video.id,
      //     }),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          )
        ]),
        child: Row(
          children: <Widget>[
            Image(
              image: NetworkImage(video.thunbnailUrl),
              width: 150.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: Text(
              video.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ))
          ],
        ),
      ),
    );
  }

  void _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instace
        .fetchVideoFromPlaylist(playlistId: canale.uploadPlaylistId);
    List<Video> allVideos = canale.videos..addAll(moreVideos);
    setState(() {
      canale.videos = allVideos;
    });
    _isLoading = false;
  }
}
