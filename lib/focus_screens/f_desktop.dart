// import 'package:english/screen/aap_bar.dart';
import 'package:flutter/material.dart';
import '../article_content.dart';
import '../components/Article.dart';
import '../components/Focus.dart';
import '../const/color.dart';
import '../constWidget/textwidget.dart';



class f_DesktopPage extends StatefulWidget {


  f_DesktopPage({required this.article_name_in, required this.selected_index,required this.selected_index2,required this.textsize});
  final int article_name_in;
  final int selected_index;
  final int selected_index2;
  final double textsize;
  @override
  State<f_DesktopPage> createState() => _f_DesktopPageState();
}

class _f_DesktopPageState extends State<f_DesktopPage> {

  // Color btn_col=Colors.white;

  Color btn_col = Colors.white;
  // double textsize=20;
  // int selected_index=3;
  // int article_name_in=0;
  // int selected_index2=1;






  @override
  Widget build(BuildContext context) {
    int articleIndex = widget.article_name_in;
    int selectedIndex = widget.selected_index;
    int selectedIndex2 = widget.selected_index2;
    double textsizeIndex = widget.textsize;

    var mq= MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Colors.white,

      body: Column(
        children: [
          Expanded(
            child:
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding:  EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // Article image
                        Article_image(height:mq.height*0.15,width:mq.width*0.15,imgurl:articles[articleIndex]['article_image']),

                        // Article name
                        const SizedBox(width:0),
                        textwidget(articles[articleIndex]['article_name'],25, FontWeight.bold, textcolor),

                        // Article in Focus mode
                        const SizedBox(width:0),
                        InkWell(onTap:(){Navigator.pop(context);},child:Focas_container(focustext:"Exit focus Mode",height:mq.height* 0.080,width:mq.width* 0.15,fontsize:17))

                      ],),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Level_con(m_height:70, m_width:840, level_text_size:20, space_l_b:20),
                        Container(
                            width:mq.width*0.450,
                            height:mq.height*0.090,
                            // LEVEL TEXT
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                                    textwidget("Level",25, FontWeight.bold, menu),
                                    SizedBox(width:20),

                                    //DIFFERENT LEVEL ACCORDING TO THE NUMBERS'S  CONTAINER
                                    Container(
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children:[
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==1?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selectedIndex=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==2?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selectedIndex=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==3?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selectedIndex=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==4?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selectedIndex=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==5?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selectedIndex=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
                                        ],),
                                    ),
                                  ]),
                            )),


                        // Article font size

                        SizedBox(width:250),

                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(height:30,
                            child:Row(mainAxisAlignment: MainAxisAlignment.start,

                              children:[
                                FloatingActionButton(elevation: 0.0,backgroundColor:
                                selectedIndex2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {selectedIndex2=1;textsizeIndex=22;});},
                                    child: textwidget("A",15, FontWeight.w500, Colors.black)),
                                FloatingActionButton(elevation: 0.0,backgroundColor:
                                selectedIndex2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {selectedIndex2=2;textsizeIndex=24;});},
                                    child: textwidget("A", 20, FontWeight.w500, Colors.black)),
                                FloatingActionButton(elevation: 0.0,backgroundColor:
                                selectedIndex2==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {selectedIndex2=3;textsizeIndex=26;});},
                                    child: textwidget("A",23, FontWeight.w500, Colors.black)),

                              ],),
                          ),
                        ),

                      ],),
                    SizedBox(height:30),
                    // Article content
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: textwidget(articles[articleIndex]['versions'][selectedIndex-1],
                                textsizeIndex, FontWeight.w300,Colors.black))
                    ),

                  ],
                ),
              ),
            ),
          ),

          // Container(height: 60,width:mq.width
          //     ,child:bottomScreen(article_name_in:article_name_in)),

        ],
      ),
    );
  }
}






