import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roboclub_flutter/helper/custom_icons.dart';
import 'package:roboclub_flutter/helper/dimensions.dart';
import 'package:roboclub_flutter/screens/youtubeplayer.dart';
import 'package:roboclub_flutter/services/tutorial.dart';
import 'package:roboclub_flutter/widgets/appBar.dart';
import 'package:roboclub_flutter/widgets/drawer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var vpH, vpW;
  List<dynamic> list;
  bool _isLoading = true;

  @override
  void initState() {
    TutorialService().fetchProjects().then((value) {
      list = value;
      list.forEach((element) {
        String videoId = YoutubePlayer.convertUrlToId(element['url']);
        element['videoId'] = videoId;
      });
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vpH = getViewportHeight(context);
    vpW = getViewportWidth(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: appdrawer(context, page: "Tutorials"),
        appBar: appBar(
          context,
          strTitle: "TUTORIALS",
          isDrawer: true,
          isNotification: false,
          scaffoldKey: _scaffoldKey,
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  height: vpH * 0.9,
                  child: list.length == 0
                      ? Center(
                          child: Column(
                            children: [
                              Container(
                                height: vpH * 0.6,
                                width: vpW * 0.7,
                                child: SvgPicture.asset(
                                  'assets/illustrations/playlist.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text('About to see Awesome Playlist!')
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => YoutubePlayerScreen(
                                    title: list[index]["title"],
                                    url: list[index]["url"],
                                  ),
                                ),
                              ),
                              child: Container(
                                width: vpW * 0.85,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    children: [
                                      Container(
                                          child: CachedNetworkImage(
                                        imageUrl:
                                            'https://img.youtube.com/vi/${list[index]['videoId']}/0.jpg',
                                        placeholder:
                                            (BuildContext context, String str) {
                                          return Container(
                                            height: vpH * 0.4,
                                            width: vpW * 0.7,
                                            child: SvgPicture.asset(
                                              'assets/illustrations/playlist.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          );
                                        },
                                        fadeInCurve: Curves.easeIn,
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fit: BoxFit.cover,
                                      )),
                                      ListTile(
                                        tileColor: Colors.grey.withOpacity(0.4),
                                        leading: Icon(
                                          SocialMedia.youtube,
                                          color: Colors.red,
                                        ),
                                        title: Text(
                                          list[index]['title'],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                YoutubePlayerScreen(
                                              title: list[index]["title"],
                                              url: list[index]["url"],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
      ),
    );
  }
}
