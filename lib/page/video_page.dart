import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../model/video.dart';
import 'package:http/http.dart' as http;
import '../config.dart';



class VideoPage extends StatefulWidget {
  final String category_title, category_id;
  
  const VideoPage({Key? key, required this.category_title, required this.category_id}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController youtubePlayerController;
  late String videoUrl = "https://www.youtube.com/watch?v=betAZeKRpR8";
  // late String videoUrl = "";
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late String? videoID = YoutubePlayer.convertUrlToId(videoUrl);
  List<Video> videoList = <Video>[];
  String titlecenter = "No video available...";

  @override
  void initState() {
      loadVideo(widget.category_id.toString());
    super.initState();
    
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFFF1F4F8),
          appBar: AppBar(
          backgroundColor: const Color(0xFFACD783),
          automaticallyImplyLeading: true,
          title: Text(widget.category_title.toString(),
            style: const TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold, color: Colors.white)
          ),
          actions: [],
          centerTitle: true,
          elevation: 5,
        ),
        body: videoList.isEmpty ? 
        Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(titlecenter,
            style: const TextStyle(fontSize: 14, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold),
          ),
        ),
      ) :
          SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: List.generate(
                      videoList.length,(index) {
                        videoUrl = "https://www.youtube.com/watch?v=" + videoList[index].video_url.toString();
                        videoID = YoutubePlayer.convertUrlToId(videoUrl);
                        youtubePlayerController = YoutubePlayerController(
                          initialVideoId: videoID!,
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                            disableDragSeek: false,
                            loop: false,
                            isLive: false,
                            forceHD: false,
                            ));
                        return SingleChildScrollView(
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                              // child: Expanded(
                                child: Column(
                                  children: [
                                    YoutubePlayer(
                                controller: youtubePlayerController,
                                 showVideoProgressIndicator :true,
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
                      SizedBox(height: 10),
                      const Divider(thickness: 2,)
                      ],
                                  
                                )
                                
                      // )
                      
                          ),)
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

  void loadVideo(String search){
  http.post(
   Uri.parse(Config.server + "/signlearn/php/load_video.php"),
   body: {
    'search' : search
    }).then((response) {
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
    onTimeout:(){
      return;
    },
    );
    // videoID = YoutubePlayer.convertUrlToId(videoUrl);
    // youtubePlayerController = YoutubePlayerController(
    //   initialVideoId: videoID!,
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: false
    //     ));
  }
}
