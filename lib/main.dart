
// import 'package:englishetc_voice_ai/mainscreens/desktop.dart';
// import 'package:englishetc_voice_ai/mainscreens/mobile.dart';
// import 'package:englishetc_voice_ai/mainscreens/tablet.dart';
// import 'package:englishetc_voice_ai/responsive/responsive_layout.dart';
// import 'package:englishetc_voice_ai/splash.dart';
// import 'package:englishetc_voice_ai/voice_re.dart';
import 'package:etc/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  FlutterTts flutterTts = FlutterTts();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get googleSignInAccount => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'etc-ai',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),

        // home:ErrorPronunciation()
        home:splashScreen()
      // home: Responsive_layout(
      //           mobileScaffold: MobilePage(title: 'mobilepage',userdata:googleSignInAccount),
      //           tabletScaffold: tabletPage(title: 'tabletpage',userdata:googleSignInAccount),
      //           desktopScaffold: DesktopPage(title: 'desktoppage',userdata:googleSignInAccount))

    );
  }
}

