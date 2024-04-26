import 'package:flutter/material.dart';

class LearnRoute extends StatelessWidget {
  const LearnRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learn More',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Scrollbar(
        interactive: true,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                // margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'What is color blindness?',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  'If you have color blindness (color vision deficiency), it means you see colors differently than most people.'
                      ' \n\nMost of the time, color vision deficiency makes it hard to tell the difference between certain colors.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans'),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                // margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'What are the types of color vision deficiency?',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  'The most common type of color vision deficiency makes it hard to tell the difference between red and green.'
                      'Another type makes blue and yellow look the same. In rare cases, people have complete color vision deficiency, which means they don’t see color at all.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans'),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                // margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Types of color blindness:',
                  style: TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: const Image(image: AssetImage('images/og.jpeg'))),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  'Original image',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans'),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                // margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  '(1) Red-green color blindness',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  'Red-green color blindness is the most common form of the condition.'
                      ' This type of color blindness makes it difficult to differentiate between shades of red and green.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans'),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: const Image(image: AssetImage('images/rb.jpeg'))),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  'This is what a person having red blue colorblindness sees',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans'),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                // margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  '(2) Blue-yellow color blindness',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  'Blue-yellow color blindness is less common than red-green color blindness, though red-green color blindness often accompanies it.'
                      ' With this type of color blindness, you have trouble differentiating between blue and green, as well as between yellow and red.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans'),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: const Image(image: AssetImage('images/bg.jpeg'))),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  'This is what a person having blue yellow color blindness sees',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans'),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                // margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  '(3) Complete color blindness',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  'Complete color blindness is rare. This type of color blindness, also called achromatopsia,'
                      ' occurs when all the cones of the eye are either dysfunctional or missing.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans'),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: const Image(image: AssetImage('images/gs.jpeg'))),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  'This is what a person having complete color blindness sees',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans'),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: SizedBox(
                  width: 110,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 45, 45, 45)),
                      // foregroundColor: MaterialStateProperty.all(
                      //     const Color.fromARGB(255, 130, 130, 130))
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);

                    },
                    child: const Text(
                      'Go Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black26,
    );
  }
}
