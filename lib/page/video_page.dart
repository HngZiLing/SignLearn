import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../model/video.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class VideoPage extends StatefulWidget {
  final String categoryTitle, categoryId;

  const VideoPage(
    {Key? key, required this.categoryTitle, required this.categoryId}
  ) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController youtubePlayerController;
  late String videoUrl = "https://www.youtube.com/watch?v=betAZeKRpR8";
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String? videoID = YoutubePlayer.convertUrlToId(videoUrl);
  List<Video> videoList = <Video>[];
  String titlecenter = "No video available...";
  late InAppWebViewController webController;

  @override
  void initState() {
    loadVideo(widget.categoryId.toString());
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFACD783),
        automaticallyImplyLeading: true,
        title: Text(widget.categoryTitle.toString(),
            style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: const [],
        centerTitle: true,
        elevation: 5,
      ),
      body: videoList.isEmpty
      ? Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            titlecenter,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Raleway',
              height: 1.5,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ) : SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: List.generate(videoList.length, (index) {
                    videoUrl = "https://www.youtube.com/watch?v=${videoList[index].videoUrl}";
                    videoID = YoutubePlayer.convertUrlToId(videoUrl);
                    InAppWebView(
                      initialUrlRequest: URLRequest(url: Uri.parse(videoUrl.toString())),
                      onWebViewCreated: (InAppWebViewController controller) {
                        webController = controller;
                      },
                      androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                        return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT,
                        );
                      }
                    );
                    youtubePlayerController = YoutubePlayerController(
                      initialVideoId: videoID!,
                      flags: const YoutubePlayerFlags(
                        enableCaption: false,
                        isLive: false,
                        autoPlay: false,
                        mute: false,
                        disableDragSeek: false,
                        loop: false,
                        forceHD: false,
                      )
                    );
                    return SingleChildScrollView(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Column(
                            children: [
                              YoutubePlayer(
                                controller: youtubePlayerController,
                                showVideoProgressIndicator: true,
                                bottomActions: [
                                  CurrentPosition(),
                                  ProgressBar(
                                    isExpanded: true,
                                    colors: const ProgressBarColors(
                                      playedColor: Colors.amber,
                                      handleColor: Colors.amberAccent
                                    ),
                                  ),
                                  const PlaybackSpeedButton(),
                                ]
                              ),
                              const SizedBox(height: 10),
                              const Divider(thickness: 2)
                            ],
                          )
                        )
                      )
                    );
                  }),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadVideo(String search) {
    http.post(Uri.parse("${Config.server}/signlearn/php/load_video.php"),
        body: {'search': search}).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        if (extractdata['video'] != null) {
          videoList = <Video>[];
          extractdata['video'].forEach((v) {
            videoList.add(Video.fromJson(v));
          });
          setState(() {});
        }
      }
    }).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        return;
      },
    );
  }
}
