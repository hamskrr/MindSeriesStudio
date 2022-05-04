import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mindseries/pages/splash_screen.dart';
import 'package:mindseries/providers/database_provider.dart';
import 'package:mindseries/providers/profileProvider.dart';
import 'package:provider/provider.dart';

import '../../components/image_viewer.dart';
import '../../components/ms_videoplayer.dart';
import '../../components/profile_tile.dart';
import '../../models/feed.dart';
import '../../models/profile.dart';

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
      child: StreamBuilder<List<Feed>>(
        stream: DBProvider.of(context)?.db?.retrieveFeeds(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting :
              return SplashScreen();
            default:
              feedContent = snapshot.data ?? [];
              return feedContent.length < 1 ? Center(
                child: Text("Nothing to show yet", style: TextStyle(fontWeight: FontWeight.bold),),
              ) :PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: feedContent.length,
                  itemBuilder: (_, index) => _buildFeed(feedContent[index]));
          }
        }
      )
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
                  colors: [Colors.black54,Colors.transparent,Colors.black54]
              )
          ),
        ),
        _buildForeground(feed),

      ]
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
    Profile profile = Provider.of<ProfileProvider>(context).currentProfile!;
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
                    style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: ()async{

                    if(feed.likes.contains(profile.uid)){
                      feed.likes.remove(profile.uid);
                    }else{
                      feed.likes.add(profile.uid);
                    }
                    await DBProvider.of(context)?.db?.uploadFeed(feed:feed);
                  }, icon: Icon(feed.likes.contains(profile.uid) ? Icons.favorite : Icons.favorite_border_rounded)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.share)),

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
