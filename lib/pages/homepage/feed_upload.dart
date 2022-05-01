import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/components%20/ms_videoplayer.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../models/feed.dart';
import '../../providers/database_provider.dart';
import '../../providers/profileProvider.dart';

class FeedUpload extends StatefulWidget {
  const FeedUpload({Key? key}) : super(key: key);

  @override
  _FeedUploadState createState() => _FeedUploadState();
}

class _FeedUploadState extends State<FeedUpload> {
  TextEditingController caption = new TextEditingController();
  TextEditingController story = new TextEditingController();
  File? file;
  bool video = false;
  bool loading = false;
  String? error = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MSColors.background,
      appBar: MSAppBar.getAppBar(title: Text("Upload Inspo")),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        uploadFeed(context);
      },backgroundColor: MSColors.buttonColor, label:
          loading ? Container(
          child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation(Colors.white),),
    ): Text("Upload",style: TextStyle(color: Colors.white),)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              _buildUploader(),
              SizedBox(height: 20,),
              file!=null ? ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                  ),
                  onPressed: (){
                setState(() {
                  file = null;
                });
              }, child: Text("Clear",style: TextStyle(color:Colors.white),)):Container(),
              SizedBox(height: 10,),
              error != null ? Text(error??"",style:TextStyle(color:Colors.red,fontFamily: "roboto")):Container(),
              SizedBox(height: 10,),
              TextField(
                maxLines: null,
                controller: caption,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type Caption"

                ),
              ),
              TextField(
                maxLines: null,
                controller: story,
                style: TextStyle(
                  fontSize: 20,

                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Inspirational Message"

                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildUploader() {
    return GestureDetector(

      child: Container(
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20)
        ),
        child: file != null ? ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: video ? MSVideoPlayer(file: file, video: '',) : Image.file(file!,width: 300,height: 300,fit: BoxFit.cover,)
        ) : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(child: Text("Upload Photo"),onPressed: ()async{
                  final ImagePicker _picker = ImagePicker();
                  // Pick an image
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  final bytes = await image?.readAsBytes();
                  file = File(image?.path??"");
                  await file?.writeAsBytes(
                      bytes?.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes)??[]);

                  setState(() {
                    video = false;
                  });
                },),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(child: Text("Upload Video"),onPressed: ()async{
                  final ImagePicker _picker = ImagePicker();
                  final XFile? image = await _picker.pickVideo(source: ImageSource.gallery);
                  final bytes = await image?.readAsBytes();
                  file = File(image?.path??"");
                  await file?.writeAsBytes(
                      bytes?.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes)??[]);

                  setState(() {
                    video = false;
                  });
                },),
              ),

            ],
          )
        ),
      ),
    );
  }

  void uploadFeed(BuildContext context) async{
    //upload content

    if(caption.text.isNotEmpty && story.text.isNotEmpty){
      setState(() {
        loading = true;
      });
      final bytes = await file?.readAsBytes();
      String feedId = Uuid().v1();
      final profile = Provider.of<ProfileProvider>(context,listen: false).currentProfile;
      String? url = await DBProvider.of(context)?.db?.uploadImage(profile?.uid??"",bytes!,filename:"${profile?.uid??"test"}/feed_${feedId}");

      Feed feed = Feed(
          id:feedId,
          uploader: profile?.uid??"",
          link: url??"",
          contentType:video ? ContentType.video : ContentType.image,
          title: caption.text,
          description: story.text,
          timestamp:DateTime.now().millisecondsSinceEpoch
      );

      await DBProvider.of(context)?.db?.uploadFeed(feed:feed);
      const snackBar = SnackBar(
        content: Text('Upload Succes!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
      setState(() {
        loading = false;
        error=null;
      });
    }else{
      setState(() {
        error = "Please enter Caption and an inspirational message";
      });
    }

  }
}
