import 'package:flutter/material.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

late List<CameraDescription> _cameras;

class CamRoute extends StatefulWidget {
  @override
  const CamRoute({super.key});
  @override
  State<CamRoute> createState() => _CamRouteState();
}

class _CamRouteState extends State<CamRoute> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  // String _centerPixelRGB = '';
  String _centerPixelRGB = '';
  @override
  void initState() {
    super.initState();




    availableCameras().then((cameras) {
      if (cameras.isNotEmpty) {
        _controller = CameraController(cameras[0], ResolutionPreset.medium);
        _initializeControllerFuture = _controller.initialize();
        _initializeControllerFuture.then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
          _controller.startImageStream((CameraImage image) {
            // if (mounted) {
            //   setState(() {
            //     _centerPixelRGB = _getCenterPixelRGB(image);
            //   });
            // }
          });
        });
      }
    });
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if ( !_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Real time color detection',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          CameraPreview(_controller),
          Center(
            child: Text(
              _centerPixelRGB,
              style: const TextStyle(color: Colors.black26, fontSize: 24.0),
            ),
          ),
        ],
      ),
    );
  }
}
