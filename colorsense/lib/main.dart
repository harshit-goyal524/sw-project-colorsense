import 'package:flutter/material.dart';
import './test.dart';
import './label.dart';
import './learn.dart';
import './cam.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ColorSense",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 60, bottom: 30),
              child: const Text(
                'Select a function:',
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: '',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 45, 45, 45)),
                  // foregroundColor: MaterialStateProperty.all(
                  //     const Color.fromARGB(255, 130, 130, 130)),
                  minimumSize: const MaterialStatePropertyAll(
                      Size(double.infinity, 120)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LabelRoute()),
                  );
                },
                child: const Text(
                  'Display color labels on image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,

                    // backgroundColor: Colors.black38,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 45, 45, 45)),
                  // foregroundColor: MaterialStateProperty.all(
                  //     const Color.fromARGB(255, 130, 130, 130)),
                  minimumSize: const MaterialStatePropertyAll(
                      Size(double.infinity, 120)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CamRoute()),
                  );
                },
                child: const Text(
                  'Real time color detection',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 45, 45, 45)),
                  // foregroundColor: MaterialStateProperty.all(
                  //     const Color.fromARGB(255, 130, 130, 130)),
                  minimumSize: const MaterialStatePropertyAll(
                      Size(double.infinity, 120)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestRoute()),
                  );
                },
                child: const Text(
                  'Color blindness test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    // backgroundColor: Colors.black38,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 45, 45, 45)),
                  // foregroundColor: MaterialStateProperty.all(
                  //     const Color.fromARGB(255, 130, 130, 130)),
                  minimumSize: const MaterialStatePropertyAll(
                      Size(double.infinity, 120)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LearnRoute()),
                  );
                },
                child: const Text(
                  'Learn more about color blindness',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black26,
    );
  }
}
