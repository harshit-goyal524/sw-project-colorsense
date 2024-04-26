import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'dart:math' as math;

class LabelRoute extends StatefulWidget {
  const LabelRoute({super.key});

  @override
  State<LabelRoute> createState() => _LabelRouteState();
}

class _LabelRouteState extends State<LabelRoute> {
  File? _imageFile;
  Uint8List? _highlightedImageData;
  int lb=0;
  int ub=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Label Image',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Scrollbar(
        interactive: true,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: const Text(
                  'Select a color to identify:',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: '',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(
                        LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("red"),

                    child: const Text(
                      'Red',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("orange"),

                    child: const Text(
                      'Orange',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("yellow"),

                    child: const Text(
                      'Yellow',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("blue"),

                    child:const Text(
                      'Blue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("green"),

                    child:const  Text(
                      'Green',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("brown"),

                    child:const  Text(
                      'Brown',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.cyan),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("cyan"),

                    child:const Text(
                      'Cyan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lime),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("lime"),

                    child:const Text(
                      'Lime',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("indigo"),

                    child: const Text(
                      'Indigo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("violet"),

                    child:const  Text(
                      'Violet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink),
                      shape: MaterialStateProperty.all(
                        LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("magenta"),

                    child:const Text(
                      'Magenta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                      shape: MaterialStateProperty.all(
                          LinearBorder.none
                      ),
                    ),
                    onPressed: () => _chooseColor("pink"),

                    child:const Text(
                      'Pink',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),

                ],
              ),
              if (_imageFile != null) ...[
                Image.file(_imageFile!, width: 300, height: 300),
                const SizedBox(height: 10),
                _highlightedImageData != null
                    ? Image.memory(_highlightedImageData!, width: 300, height: 300)
                    : const Text('Processing image...'),
              ] else
                Center(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(100, 150, 100, 150),
                      child: const Text('No image has been selected as of now',
                        style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                  ),
                ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                child: const Text(
                  'Select an image:',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: '',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    height: 60,
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
                      onPressed: () => _pickImage(ImageSource.camera),

                      child: const Row( // Use a Row widget to layout the icon and text horizontally
                        mainAxisSize: MainAxisSize.min, // Use min to prevent the Row from expanding to the full width
                        children: [
                          Icon(
                            Icons.camera_alt, // The icon
                            color: Colors.white, // Icon color
                          ),
                          SizedBox(width: 8), // Add some spacing between the icon and text
                          Text(
                            'Camera',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    height: 60,
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
                      onPressed: () => _pickImage(ImageSource.gallery),

                      child: const Row( // Use a Row widget to layout the icon and text horizontally
                        mainAxisSize: MainAxisSize.min, // Use min to prevent the Row from expanding to the full width
                        children: [
                          Icon(
                            Icons.photo_library, // The icon
                            color: Colors.white, // Icon color
                          ),
                          SizedBox(width: 8), // Add some spacing between the icon and text
                          Text(
                            'Gallery',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
      backgroundColor: Colors.black26,
    );
  }
  void _chooseColor(String colorName) async {
    switch (colorName) {
      case "red":
        setState(() {
          lb = 0;
          ub = 10;
        });
        break;
      case "orange":
        setState(() {
          lb = 10;
          ub = 45;
        });
        break;
      case "yellow":
        setState(() {
          lb = 40;
          ub = 90;
        });
        break;
      case "lime":
        setState(() {
          lb = 80;
          ub = 150;
        });
        break;
      case "green":
        setState(() {
          lb = 130;
          ub = 180;
        });
        break;
      case "brown":
        setState(() {
          lb = 10;
          ub = 25;
        });
        break;
      case "cyan":
        setState(() {
          lb = 190;
          ub = 250;
        });
        break;
      case "blue":
        setState(() {
          lb = 220;
          ub = 270;
        });
        break;
      case "indigo":
        setState(() {
          lb = 250;
          ub = 295;
        });
        break;
      case "violet":
        setState(() {
          lb = 280;
          ub = 330;
        });
        break;
      case "magenta":
        setState(() {
          lb = 310;
          ub = 345;
        });
        break;
      case "pink":
        setState(() {
          lb = 330;
          ub = 360;
        });
        break;
      default:
        setState(() {
          lb = 0;
          ub = 360;
        });
        break;
    }
  }

  void _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _processImage(_imageFile!.path);
      });
    }
  }

  void _processImage(String imagePath) async {
    final image = img.decodeImage(File(imagePath).readAsBytesSync());
    if (image != null) {
      img.Image highlighted = _highlightColor(image);
      setState(() {
        _highlightedImageData = Uint8List.fromList(img.encodeJpg(highlighted));
      });
    }
  }

  img.Image _highlightColor(img.Image image) {
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        int pixel = image.getPixel(x, y);
        var hsv = rgbToHsv(img.getRed(pixel), img.getGreen(pixel), img.getBlue(pixel));

        if (hsv[0] > lb && hsv[0] < ub) { // Hue value for yellow
          image.setPixel(x, y, img.getColor(0, 0, 0));  // Setting pixel to black
        }
      }
    }
    return image;
  }

  List<double> rgbToHsv(int r, int g, int b) {
    double red = r / 255.0;
    double green = g / 255.0;
    double blue = b / 255.0;

    double max = math.max(red, math.max(green, blue));
    double min = math.min(red, math.min(green, blue));
    double delta = max - min;

    double h, s;
    if (max == 0) {
      s = 0;
    } else {
      s = delta / max;
    }

    if (delta == 0) {
      h = 0;
    } else if (max == red) {
      h = ((green - blue) / delta) % 6;
    } else if (max == green) {
      h = ((blue - red) / delta) + 2;
    } else {
      h = ((red - green) / delta) + 4;
    }

    h *= 60;
    if (h < 0) h += 360;

    return [h, s, max];  // Hue, Saturation, Value
  }
}
