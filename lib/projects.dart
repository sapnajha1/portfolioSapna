import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProject extends StatefulWidget {
  const MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  // Function to launch a URL
  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to create a project card
  Widget projetCard(lang, title, description, githubUrl) {
    return GestureDetector(
      onTap: () {
        if (githubUrl.isNotEmpty) {
          launchUrl(githubUrl);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 220,
        child: Card(
          color: Color(0xFF0F3555),
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 30, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {
                        if (githubUrl.isNotEmpty) {
                          launchUrl(githubUrl);
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Projects', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 20, top: 10),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              projetCard(
                'FLUTTER',
                'English AI',
                'used ChatGpt (currently Working)',
                'https://github.com/sapnajha1/demovoice/tree/updatecode',
              ),
              projetCard(
                'FLUTTER',
                'Weather App',
                'Detect Weather of Device Location',
                'https://github.com/sapnajha1/weatherApp/tree/master',
              ),
              projetCard(
                'FLUTTER',
                'Recipe App',
                'App for Food Recipe',
                'https://github.com/sapnajha1/recipe_app',
              ),
              projetCard(
                'FLUTTER',
                'TIk TAK TOE',
                'Gaming App.',
                'https://github.com/sapnajha1/TikTakToe/tree/master',
              ),
              projetCard(
                'FLUTTER',
                'Note Pad',
                'Offline Note Pad',
                'https://github.com/sapnajha1/NotePad_Flutter',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
