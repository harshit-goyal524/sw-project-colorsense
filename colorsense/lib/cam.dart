import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:math' as math;

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(home: CameraApp()));
}

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp>  createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  bool _isInitialized = false;
  String _colorText = 'Fetching color...';
  late DateTime lastImageProcessedTime;

  @override
  void initState() {
    super.initState();
    lastImageProcessedTime = DateTime.now();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() {
          _colorText = 'No cameras available';
        });
        return;
      }
      _controller = CameraController(cameras.first, ResolutionPreset.medium);
      await _controller.initialize();
      _startImageStream();
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      setState(() {
        _colorText = 'Camera initialization failed: $e';
      });
      print('Error initializing camera: $e');
    }
  }


  void _startImageStream() {
    _controller.startImageStream((CameraImage image) {
      final now = DateTime.now();
      if (now.difference(lastImageProcessedTime) > Duration(milliseconds: 1000)) { // Throttle frame processing
        final colorData = _getAverageCenterPixelColor(image);
        if (mounted) {
          setState(() {
            _colorText = colorData;
            lastImageProcessedTime = now;
          });
        }
      }
    });
  }


  String _getAverageCenterPixelColor(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final int startX = (width / 2 - 10).round(); // 10 pixels left from center
    final int startY = (height / 2 - 10).round(); // 10 pixels up from center

    int pixelCount = 0;
    int sumRed = 0, sumGreen = 0, sumBlue = 0;

    // Iterate over the block of 20x20 pixels
    for (int y = startY; y < startY + 20; y++) {
      for (int x = startX; x < startX + 20; x++) {
        int byteIndex = y * image.planes.first.bytesPerRow + x * 4;
        if (byteIndex + 2 < image.planes.first.bytes.length) { // Check for buffer overflow
          sumRed += image.planes.first.bytes[byteIndex];
          sumGreen += image.planes.first.bytes[byteIndex + 1];
          sumBlue += image.planes.first.bytes[byteIndex + 2];
          pixelCount++;
        }
      }
    }

    if (pixelCount == 0) return "Unable to calculate average color.";

    // Calculate average colors
    int avgRed = (sumRed / pixelCount).round();
    int avgGreen = (sumGreen / pixelCount).round();
    int avgBlue = (sumBlue / pixelCount).round();

    List<double> hsv = rgbToHsv(avgRed, avgGreen, avgBlue);
    String colorName = getColorNameFromHue(hsv[0]);

    return 'Average RGB: $avgRed, $avgGreen, $avgBlue - Hue: ${hsv[0].toStringAsFixed(2)} - $colorName';
  }


  List<double> rgbToHsv(int r, int g, int b) {
    double red = r / 255.0;
    double green = g / 255.0;
    double blue = b / 255.0;
    double max = math.max(red, math.max(green, blue)), min = math.min(red, math.min(green, blue));
    double delta = max - min;
    double h = 0, s = max == 0 ? 0 : delta / max, v = max;

    if (delta == 0) {
      h = 0;
    } else if (max == red) {
      h = (green - blue) / delta + (green < blue ? 6 : 0);
    } else if (max == green) {
      h = (blue - red) / delta + 2;
    } else if (max == blue) {
      h = (red - green) / delta + 4;
    }
    h *= 60;

    return [h, s, v];
  }

  String getColorNameFromHue(double hue) {
    if (hue < 30 || hue>330) return "Red";
    if (hue < 40) return "Orange";
    if (hue < 75) return "Yellow";
    if (hue < 150) return "Green";
    if (hue < 260) return "Blue";
    if (hue < 300) return "Purple";
    return "Pink"; // Hue > 300
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Color finder',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          CameraPreview(_controller),
          CustomPaint(
            size: Size.infinite,
            painter: CrosshairPainter(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.black45,
              padding: EdgeInsets.all(8),
              child: Text(
                _colorText,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black26,
    );
  }



}
class CrosshairPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double lineLength = 20; // Length of the crosshair lines

    // Draw horizontal line
    canvas.drawLine(Offset(centerX - lineLength, centerY), Offset(centerX + lineLength, centerY), paint);
    // Draw vertical line
    canvas.drawLine(Offset(centerX, centerY - lineLength), Offset(centerX, centerY + lineLength), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
