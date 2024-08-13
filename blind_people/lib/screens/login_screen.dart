import 'package:blind_people/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
            height: 1000,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors:

                    [
                      Colors.deepPurpleAccent,
                      Colors.white
                    ],begin: Alignment.bottomCenter
                )
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      height:350,
                        child: Lottie.network('https://lottie.host/82d63dc8-6731-42ca-a1fa-aebde1e359af/6Ztz9ndRr1.json')),
                  )
                 , Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(

                      ),

                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white70,
                              Colors.white70
                            ]
                          )
                        ),
                        child: Column(

                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GradientText(
                                    'Welcome',
                                    style: const TextStyle(
                                      fontSize: 25
                                    ),
                                    colors: [
                                      Colors.purple,
                                      Colors.purpleAccent,
                                      Colors.pinkAccent
                                    ],
                                  ),
                                )),

                            const Padding(
                              padding: EdgeInsets.only(left: 20, top: 40,right: 20,bottom: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.email_outlined),
                                  hintText: "Email",
                                  labelText: "Email",
                                  border: OutlineInputBorder()
                                ),

                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20, top: 10,right: 20,bottom: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.password),
                                    hintText: "Password",
                                    labelText: "password",
                                    border: OutlineInputBorder()
                                ),

                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                              },
                                  child: const Text(
                                    'login'
                                  )),
                            ),
                            const Divider(),
                            const Text('Forget Password ?'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
