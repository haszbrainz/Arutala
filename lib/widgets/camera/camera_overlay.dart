import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:program_arutala/themes/custom_icons.dart';

class CameraOverlay extends StatelessWidget {
  final bool isLatinToAksara;
  final Function() onToggleLanguage;
  final Function() onToggleFlash;
  final Function() onCaptureImage;
  final CameraController controller;

  const CameraOverlay({
    Key? key,
    required this.isLatinToAksara,
    required this.onToggleLanguage,
    required this.onToggleFlash,
    required this.onCaptureImage,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildTopControls(),
        _buildCameraPreviewBox(context),
        _buildBottomControls(),
      ],
    );
  }

  Widget _buildTopControls() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLanguageLabel(isLatinToAksara ? 'Latin' : 'Aksara'),
            _buildLanguageToggleButton(),
            _buildLanguageLabel(isLatinToAksara ? 'Aksara' : 'Latin'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageLabel(String text) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: const Color(0x81FFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildLanguageToggleButton() {
    return ElevatedButton(
      onPressed: onToggleLanguage,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
        backgroundColor: const Color(0x81FFFFFF),
      ),
      child: const Icon(
        ArutalaIcons.arrowLeftRight,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  Widget _buildCameraPreviewBox(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipRect(
        child: SizedBox(
          width: 250,
          height: 250,
          child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CameraPreview(controller),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildGalleryButton(),
            _buildCaptureButton(),
            _buildFlashButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.white,
      ),
      child: const Icon(
        ArutalaIcons.imageUp,
        color: Color(0xFF2196F3),
        size: 24,
      ),
    );
  }

  Widget _buildCaptureButton() {
    return OutlinedButton(
      onPressed: onCaptureImage,
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        backgroundColor: Colors.transparent,
        side: const BorderSide(
          color: Color(0xFF6AB9F7),
          width: 4,
        ),
      ),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildFlashButton() {
    return ElevatedButton(
      onPressed: onToggleFlash,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.white,
      ),
      child: const Icon(
        ArutalaIcons.zap,
        color: Color(0xFF2196F3),
        size: 24,
      ),
    );
  }
}