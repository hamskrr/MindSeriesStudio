import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mindseries/Theme/app_theme.dart';
import 'package:mindseries/models/auth_service.dart';
import 'package:mindseries/models/db_service.dart';
import 'package:mindseries/pages/ms_router.dart';
import 'package:mindseries/providers/auth_provider.dart';
import 'package:mindseries/providers/database_provider.dart';
import 'package:mindseries/providers/profileProvider.dart';
import 'package:mindseries/providers/settingsProvider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'models/setting.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);

  }catch(e){
  }

  runApp( ChangeNotifierProvider<SettingProvider>(
      create: (_) => SettingProvider(),
      child:MSApp()));
}

class MSApp extends StatefulWidget {
  const MSApp({Key? key}) : super(key: key);

  @override
  _MSAppState createState() => _MSAppState();
}

class _MSAppState extends State<MSApp> {
  @override
  Widget build(BuildContext context) {
    Setting setting =Provider.of<SettingProvider>(context).setting;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProfileProvider>(
              create: (context) => ProfileProvider()),
        ],
        child: AuthProvider(
            auth: FireAuth(),
            child: DBProvider(
              db: FireDB(),
              child: GetMaterialApp(
                locale:  Locale(setting.language?.split("_").first??"en",setting.language?.split("_").last??"US"),
                theme: setting.darkmode ? Themes.darkTheme : Themes.lightTheme,
                home:   Consumer<ProfileProvider>(
                      builder: (context, profile, child) {
                        return const MSRouter();

                  // backgroundColor: Color.fromRGBO(21, 34, 56, 1),
                }),
                ),
              ),
            ));
  }
}


