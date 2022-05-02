import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/components%20/profile_avatar.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/authentication/login.dart';
import 'package:mindseries/providers/auth_provider.dart';
import 'package:mindseries/providers/database_provider.dart';
import 'package:provider/provider.dart';

import '../../models/profile.dart';
import '../../providers/profileProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? bytes;

  bool editMode = false;
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController unameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Profile? profile = Provider.of<ProfileProvider>(context).currentProfile;
    emailController.text = profile?.email ?? "";
    fnameController.text = profile?.fname ?? "";
    lnameController.text = profile?.lname ?? "";
    unameController.text = profile?.username ?? "";
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MSAppBar.getAppBar(actions: [
        TextButton.icon(
            onPressed: () {
              AuthProvider.of(context)?.auth?.signOut();
              NavigationControl(nextPage: LoginPage()).replaceWith(context);
            }, icon: Icon(Icons.logout), label: Text("Sign out"))
      ]),
      backgroundColor: MSColors.background,
      body: editMode ? buildEditProfile(context) : buildProfile(),
    );
  }

  buildEditProfile(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: ()async{

                        final ImagePicker _picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                        bytes = await image?.readAsBytes();
                        setState(() {

                        });
                      },
                      child:  bytes != null
                          ? CircleAvatar(
                        backgroundImage: MemoryImage(bytes!),
                      )
                          : ProfileAvatar(
                          image:Provider.of<ProfileProvider>(context).currentProfile?.picture),

                    ),
                    Row(
                      children: [
                    loading ? Container(
                    child: CircularProgressIndicator(),
                    ): ElevatedButton(onPressed: () {
                          setState(() {
                            editMode = !editMode;
                            saveProfile();
                          });
                        }, child: const Text("Save",style: TextStyle(color: Colors.white),)),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Cabin',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //last name text box
                  Container(
                      child: TextFormField(
                    controller: unameController,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Cabin',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                    validator: (v) =>
                        (v ?? "").isEmpty ? "cannot be empty" : null,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        //  hintText: 'type text',
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Cabin',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //last name text box
                  Container(
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Cabin',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                    controller: lnameController,
                    validator: (v) =>
                        (v ?? "").isEmpty ? "cannot be empty" : null,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        //  hintText: 'type text',
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Cabin',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //last name text box
                  Container(
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Cabin',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                    controller: fnameController,
                    validator: (v) =>
                        (v ?? "").isEmpty ? "cannot be empty" : null,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        //  hintText: 'type text',
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Cabin',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //last name text box
                  Container(
                      child: TextFormField(
                    controller: emailController,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Cabin',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                    validator: (v) =>
                        (v ?? "").isEmpty ? "cannot be empty" : null,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        //  hintText: 'type text',
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Cabin',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //last name text box
                  Container(
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Cabin',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                    controller: lnameController,
                    validator: (v) =>
                        (v ?? "").isEmpty ? "cannot be empty" : null,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        //  hintText: 'type text',
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildProfile() {
    return Container(

        child: SingleChildScrollView(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height),
                padding: const EdgeInsets.all(12.0),
                child: Column(
                   // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        bytes != null
                            ? CircleAvatar(
                              radius:100,
                                backgroundImage: MemoryImage(bytes!),
                              )
                            : ProfileAvatar(
                          radius: 200,
                                image:
                                Provider.of<ProfileProvider>(context).currentProfile?.picture),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(unameController.text,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: fnameController.text,
                        ),
                        TextSpan(
                          text: " ${lnameController.text}",
                        )
                      ]
                    ),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(emailController.text,style: TextStyle(
                  ),),

                  SizedBox(
                  height: 20,
                ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      editMode = !editMode;
                    });
                  }, child: const Text("Update",style: TextStyle(color: Colors.white),)),

                ]))));
  }

  void saveProfile() async{
    setState(() {

      loading = true;
    });
    //uploadImage..

    Profile p = Provider.of<ProfileProvider>(context,listen: false).currentProfile!;
    String? url = bytes!=null ? await DBProvider.of(context)?.db?.uploadImage(p.uid,bytes!,filename:"${p.uid}/profilePic"):null;
    p.username = unameController.text;
    p.lname = lnameController.text;
    p.fname = fnameController.text;
    p.email = emailController.text;
    p.picture = url??p.picture;
    Provider.of<ProfileProvider>(context,listen: false).updateProfile(p);
    await DBProvider.of(context)?.db?.saveProfile(profile: Provider.of<ProfileProvider>(context,listen: false).currentProfile!);
    setState(() {
      editMode = false;
      loading = false;
    });
  }
}
