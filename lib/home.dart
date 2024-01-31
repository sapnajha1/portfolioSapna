import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  aboutAchivements(num, type) {
    return Row(
      children: [
        Text(num,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Soho",
            )),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              type,
              style: TextStyle(
                fontFamily: "Soho",
              ),
            ))
      ],
    );
  }

  mySpec(icon, text) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xFF0F3555),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 16, fontFamily: "Soho", color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      height: 115,
      width: 105,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF0F3555),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: PopupMenuButton(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          icon: Icon(Icons.menu,color: Colors.white,),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                child: Text(
                  'Projects',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/project');
                },
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: TextButton(
                child: Text(
                  'About Me',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              value: 2,
            )
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SlidingSheet(
            elevation: 8,
            cornerRadius: 50,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.38, 0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 35),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.asset(
                          'images/profilebg.png',
                          height: constraints.maxHeight * 0.35,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: constraints.maxHeight * 0.35,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Sapna Jha',
                            style: TextStyle(
                              fontFamily: "Soho",
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Frontend Developer',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Soho",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(left: 20, top: 30, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Work with Technical Tools',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Soho",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mySpec(FontAwesomeIcons.android, 'Android'),
                            mySpec(FontAwesomeIcons.laptop, 'Web'),
                            mySpec(FontAwesomeIcons.database, 'Firebase'),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mySpec(FontAwesomeIcons.github, 'Github'),
                            mySpec(FontAwesomeIcons.cloud, 'Google Cloud'),
                            mySpec(FontAwesomeIcons.laptop, 'Netlify'),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Align(alignment: AlignmentDirectional.topStart,
                          child: const Text(
                            'Familiar with',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Soho",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mySpec(FontAwesomeIcons.language, 'Python'),
                            mySpec(FontAwesomeIcons.html5, 'HTML/CSS'),
                            mySpec(FontAwesomeIcons.language, 'C/C++'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
