import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

class CameraInitResult {
  final CameraController controller;
  final Future<void> initializeFuture;

  CameraInitResult({
    required this.controller,
    required this.initializeFuture,
  });
}

class CameraService {
  Future<CameraInitResult> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    final controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    final initializeFuture = controller.initialize();
    
    return CameraInitResult(
      controller: controller, 
      initializeFuture: initializeFuture
    );
  }

  Future<bool> toggleFlash(CameraController controller, bool isFlashOn) async {
    if (isFlashOn) {
      await controller.setFlashMode(FlashMode.off);
    } else {
      await controller.setFlashMode(FlashMode.torch);
    }
    return !isFlashOn;
  }

  Future<String> cropImage(String originalImagePath) async {
    // Crop image to match preview box
    final imageFile = File(originalImagePath);
    final image = await decodeImageFromList(await imageFile.readAsBytes());

    final int dimension = 750;
    final int startX = (image.width - dimension) ~/ 2;
    final int startY = (image.height - dimension) ~/ 2;

    // Create command instance
    final cmd = img.Command()
      ..decodeImageFile(originalImagePath)
      ..copyCrop(x: startX, y: startY, width: dimension, height: dimension)
      ..writeToFile('${originalImagePath}_cropped.jpg');
    await cmd.execute();

    return '${originalImagePath}_cropped.jpg';
  }
}