import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SimRoute extends StatefulWidget {
  const SimRoute({super.key});

  @override
  State<SimRoute> createState() => _SimRouteState();
}

class _SimRouteState extends State<SimRoute> {
  File? _imageFile;
  ColorFilter _colorFilter = const ColorFilter.mode(Colors.transparent, BlendMode.color);

  Future<void> _getImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _colorFilter = const ColorFilter.mode(Colors.transparent, BlendMode.color); // Reset color filter when new image is selected
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _colorFilter = const ColorFilter.mode(Colors.transparent, BlendMode.color); // Reset color filter when new image is selected
      });
    }
  }

  ColorFilter _customFilterRG() {
    return const ColorFilter.matrix(<double>[
      1, 0, 0, 0, 0,
      0, 1, 0, 0, 0,
      0, 0, 0, 0, 0,
      0, 0, 0, 1, 0,

    ]);
  }

  ColorFilter _customFilterYB() {
    return const ColorFilter.matrix(<double>[
      0.95, 0.05, 0, 0, 0,
      0, 0.433, 0.567, 0, 0,
      0, 0.475, 0.525, 0, 0,
      0, 0, 0, 1, 0,
    ]);
  }

  ColorFilter _customFilterBW() {
    return const ColorFilter.matrix(<double>[
      0.299, 0.587, 0.114, 0, 0,
      0.299, 0.587, 0.114, 0, 0,
      0.299, 0.587, 0.114, 0, 0,
      0, 0, 0, 1, 0,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Colorblindness Simulator",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 30),
              child: const Text(
                'Select where to pick image from:',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: '',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
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
                    onPressed: _getImageFromCamera,

                    child: const Row( // Use a Row widget to layout the icon and text horizontally
                      mainAxisSize: MainAxisSize.min, // Use min to prevent the Row from expanding to the full width
                      children: [
                        Icon(
                          Icons.camera_alt_rounded, // The icon
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
                    onPressed: _getImageFromGallery,

                    child: const Row( // Use a Row widget to layout the icon and text horizontally
                      mainAxisSize: MainAxisSize.min, // Use min to prevent the Row from expanding to the full width
                      children: [
                        Icon(
                          Icons.photo_library_rounded, // The icon
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


            if (_imageFile != null)
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20), // Increase margin on top and bottom
                child: ColorFiltered(
                  colorFilter: _colorFilter,
                  child: Image.file(
                    _imageFile!,
                    fit: BoxFit.fitWidth,
                    height: MediaQuery.of(context).size.height * 0.4, // Increase the height multiplier to make the image larger
                  ),
                ),
              ),

            if (_imageFile != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: SizedBox(
                      width: 150,
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
                        onPressed: () => setState(() => _colorFilter = _customFilterRG()),
                        child: const Text(
                          'Red-Green',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
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
                      onPressed: () => setState(() => _colorFilter = _customFilterYB()),
                      child: const Text(
                        'Blue-Yellow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            if (_imageFile != null)
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 150,
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
                      onPressed: () => setState(() => _colorFilter = _customFilterBW()),
                      child: const Text(
                        'Mono-colour',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),

                  child: SizedBox(
                    width: 150,
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
                      onPressed: () => setState(() => _colorFilter = const ColorFilter.mode(Colors.transparent, BlendMode.color)), // Remove filter
                      child: const Text(
                        'Original image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top:20),
              child: Center(
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
            ),


                ]
              ),
      ),

      backgroundColor: Colors.black26,
    );
  }
}