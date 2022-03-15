import 'dart:io';

import 'package:flutter/material.dart';

import '../../components /image_viewer.dart';
import '../../components /ms_videoplayer.dart';
import '../../components /profile_tile.dart';
import '../../models/feed.dart';

class InspoPage extends StatefulWidget {
  const InspoPage({Key? key}) : super(key: key);

  @override
  _InspoPageState createState() => _InspoPageState();
}

class _InspoPageState extends State<InspoPage> {
  List<Feed> feedContent = [
    Feed(id: "", uploader: "zme1Lg8Hz5MzkK65Sf5di8xrfF03", link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', contentType: ContentType.video),
    Feed(id: "", uploader: "zme1Lg8Hz5MzkK65Sf5di8xrfF03", link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', contentType: ContentType.video),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount:feedContent.length ,
          itemBuilder: (_,index)=>_buildFeed(feedContent[index]))
    );
  }

  _buildFeed(Feed feed) {
    return Stack(
      children: [
        _buildContent(feed),

        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black54,Colors.transparent]
              )
          ),
        ),
        _buildForeground(feed)],
    );
  }

  _buildContent(Feed feed) {
    switch (feed.contentType) {
      case ContentType.video:
        return MSVideoPlayer(video: feed.link);
      case ContentType.image:
        return MSImageViewer(image: feed.link);
    }
  }

  _buildForeground(Feed feed) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.symmetric(
            vertical: kBottomNavigationBarHeight + 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 6,
                child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileTile(uid:feed.uploader),
                  SizedBox(height: 20,),
                  Text(
                    feed.title ?? "Hello World",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    feed.description ?? "Hello World",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),

            Expanded(child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.2,maxHeight: 150),
              child: Column(
                children: [
                  Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded)),),
                  Spacer(flex: 1,),
                  Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.comment)),),
                  Spacer(flex: 1,),
                  Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.share)),),

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
