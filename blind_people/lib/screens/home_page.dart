
import 'dart:async';
import 'dart:io';

import 'package:blind_people/screens/uploading_page.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/image_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Blind People'),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white70,
                Colors.white
              ],begin: Alignment.bottomCenter
            )
          ),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Family Members",style: TextStyle(
                      fontSize: 20
                    ),),
                  )),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                   Container(
                     margin: const EdgeInsets.all(20),
                     height: 160,
                     width: 330,
                     decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors:
                          [
                            Colors.white70,
                            Colors.greenAccent
                          ]
                      ),
                       borderRadius: BorderRadius.circular(10),
                       boxShadow: [
                         const BoxShadow(
                           color: Colors.black12,
                           offset: Offset(3,5),
                           blurRadius: 5
                         )
                       ]
                     ),
                     child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: EdgeInsets.only(left: 20,top: 20),
                           child: CircleAvatar(
                             radius: 50,

                             backgroundImage: AssetImage('assets/heer.jpeg')
                             


                           ),
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,

                           children: [
                             Padding(
                               padding: EdgeInsets.only(left: 50,top: 30),
                               child: Text('Heer Parekh',style: TextStyle(

                                 fontSize: 25
                               ),),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: 50,top: 8),
                               child: Text("Gender : Female"),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: 50,top: 8),
                               child: Text("Age : 20"),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: 50,top: 8),
                               child: Text("Relation : Sister"),
                             )
                           ],
                         )

                       ],
                     ),
                   ),
                   Container(
                     margin: const EdgeInsets.all(20),
                     height: 160,
                     width: 330,
                     decoration: BoxDecoration(
                         gradient: const LinearGradient(
                             colors:
                             [
                               Colors.white70,
                               Colors.greenAccent
                             ]
                         ),
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: [
                           const BoxShadow(
                               color: Colors.black12,
                               offset: Offset(3,5),
                               blurRadius: 5
                           )
                         ]
                     ),
                     child: const Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: EdgeInsets.only(left: 20,top: 20),
                           child: CircleAvatar(
                             radius: 50,

                             backgroundImage: AssetImage('assets/devangshi.jpeg')


                           ),
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,

                           children: [
                             Padding(
                               padding: EdgeInsets.only(left: 50,top: 30),
                               child: Text('Devangshi',style: TextStyle(

                                   fontSize: 25
                               ),),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: 50,top: 8),
                               child: Text("Gender : female"),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: 50,top: 8),
                               child: Text("Age : 21"),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: 50,top: 8),
                               child: Text("Relation : Sister"),
                             )
                           ],
                         )

                       ],
                     ),
                   ),
                 ],
               ),
             ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Friends",style: TextStyle(
                        fontSize: 20
                    ),),
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 160,
                      width: 330,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors:
                              [
                                Colors.white70,
                                Colors.pinkAccent
                              ]
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black12,
                                offset: Offset(3,5),
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20,top: 20),
                            child: CircleAvatar(
                              radius: 50,

                              backgroundImage: AssetImage('assets/omkar.jpeg')

                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 50,top: 30),
                                child: Text('Omkar ',style: TextStyle(

                                    fontSize: 25
                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50,top: 8),
                                child: Text("Gender : Male"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50,top: 8),
                                child: Text("Age : 21"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50,top: 8,bottom: 10),
                                child: Text("Relation : Best Friends"),
                              )
                            ],
                          )

                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 160,
                      width: 330,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors:
                              [
                                Colors.white70,
                                Colors.pinkAccent
                              ]
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black12,
                                offset: Offset(3,5),
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20,top: 20),
                            child: CircleAvatar(
                              radius: 50,

                              backgroundImage: AssetImage('assets/jyoti.jpeg')


                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 50,top: 30),
                                child: Text('Jyotirmay',style: TextStyle(

                                    fontSize: 25
                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50,top: 8),
                                child: Text("Gender : Male"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50,top: 8),
                                child: Text("Age : 21"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50,top: 8),
                                child: Text("Relation : Friend"),
                              )
                            ],
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 10),
                height: 300,

           
                child: Image.network('https://files.propertywala.com/maps/202307/P32444408.jpg',fit: BoxFit.fill,)

              ),
          ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Uploading()));
        },
        child: const Icon(Icons.upload),
      ),
    );
  }
}
