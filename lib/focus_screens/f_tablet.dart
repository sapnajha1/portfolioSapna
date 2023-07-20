import 'package:flutter/material.dart';

import '../article_content.dart';
import '../components/Article.dart';
import '../components/Focus.dart';
import '../const/color.dart';
import '../constWidget/textwidget.dart';



class f_tabletPage extends StatefulWidget {


  f_tabletPage({required this.article_name_in, required this.selected_index,required this.selected_index2,required this.fontsize});
  final int article_name_in;
  final int selected_index;
  final int selected_index2;
  final double fontsize;
  @override
  State<f_tabletPage> createState() => _f_tabletPageState();
}

class _f_tabletPageState extends State<f_tabletPage> {
  // double textsize=20;
  // int selected_index=3;
  // int selected_index2=0;

  // int article_name_in=0;




  @override
  Widget build(BuildContext context) {
    int articleIndex = widget.article_name_in;
    int selectedIndex = widget.selected_index;
    int selectedIndex2 = widget.selected_index2;
    double fontsizeIndex = widget.fontsize;
    var mq= MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child:
          SingleChildScrollView(physics:AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Article_image(height:mq.height*0.15,width:mq.width*0.20,imgurl: articles[articleIndex]['article_image']),
                      const SizedBox(width:25),
                      textwidget(articles[articleIndex]['article_name'],40, FontWeight.bold, textcolor),
                      //  const SizedBox(width:30)

                    ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      InkWell(onTap:(){Navigator.pop(context);},child:Focas_container(focustext:"Exit focus Mode",height:mq.height* 0.080,width:mq.width*0.310,fontsize:28),),
                      const SizedBox(width:150),
                      Row(
                          children:[
                            FloatingActionButton(elevation: 0.0,backgroundColor:
                            selectedIndex2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {selectedIndex2=1;fontsizeIndex=18;});},
                                child: textwidget("A", 18, FontWeight.w700, Colors.black)),

                            FloatingActionButton(elevation: 0.0,backgroundColor:
                            selectedIndex2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {selectedIndex2=2;fontsizeIndex=20;});},
                                child: textwidget("A", 20, FontWeight.w700, Colors.black)),
                            FloatingActionButton(elevation: 0.0,backgroundColor:
                            selectedIndex2==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {selectedIndex2=3;fontsizeIndex=25;});},
                                child: textwidget("A",23, FontWeight.w700, Colors.black)),

                          ]),


                    ],),

                  // LEVEL ROW

                  const SizedBox(height:20),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width:mq.width*0.750,
                            height:mq.height*0.07,

                            // LEVEL TEXT
                            child:Padding(
                              padding: const EdgeInsets.only(left:20.0,right:20.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    textwidget("Level",30, FontWeight.bold, menu),
                                    SizedBox(width:30),

                                    //DIFFERENT LEVEL ACCORDING TO THE NUMBERS'S  CONTAINER

                                    Container(
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children:[
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==1?Color.fromARGB(255, 113, 168, 47):Colors.white,

                                              onPressed:(){setState(() {selectedIndex=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                              onPressed:(){setState(() {selectedIndex=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                              onPressed:(){setState(() {selectedIndex=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==4?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                              onPressed:(){setState(() {selectedIndex=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selectedIndex==5?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                              onPressed:(){setState(() {selectedIndex=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
                                        ],),
                                    ),
                                    // ),

                                  ]),
                            ))

                      ]),
                  SizedBox(height:20),

                  // ARTICLE CONTENT

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        child: textwidget(articles[articleIndex]['versions'][selectedIndex-1],
                            fontsizeIndex, FontWeight.w200, Colors.black)
                    ),
                  )

                ], ),




            ),
          ),
          ),



        ],
      ),
    );
  }
}

