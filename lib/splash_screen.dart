import 'package:flutter/material.dart';
import 'package:furniture_app/home_screen.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(70.0),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    'assets/images/img1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Creative Concept",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Design",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home_screen(),
                      ));
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xff365486),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: const Text('Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
