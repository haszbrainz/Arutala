import 'package:program_arutala/view_model/scan_vm.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/widgets/camera/camera_overlay.dart';
import 'package:program_arutala/widgets/camera/camera_service.dart';
import 'package:program_arutala/widgets/camera/scan_result_bottom_sheet.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFlashOn = false;
  bool _isLatinToAksara = true;
  late CameraService _cameraService;
  bool _isCapturing = false;

  // 1. ViewModel dibuat sebagai state variable, tapi tidak diinisialisasi di sini.
  late final ScanVM _scanVM;

  @override
  void initState() {
    super.initState();
    // 2. Inisialisasi ViewModel di initState.
    _scanVM = ScanVM();
    _cameraService = CameraService();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final result = await _cameraService.initializeCamera();
      _controller = result.controller;
      _initializeControllerFuture = result.initializeFuture;
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      debugPrint("Error initializing camera: $e");
    }
  }

  Future<void> _toggleFlash() async {
    final newFlashState =
        await _cameraService.toggleFlash(_controller, _isFlashOn);
    setState(() {
      _isFlashOn = newFlashState;
    });
  }

  void _toggleLanguage() {
    setState(() {
      _isLatinToAksara = !_isLatinToAksara;
    });
  }

  // 3. Fungsi ini sekarang menerima BuildContext yang benar.
  Future<void> _captureImage(BuildContext scaffoldContext) async {
    if (_isCapturing) {
      debugPrint('Sedang mengambil gambar, abaikan klik ganda.');
      return;
    }
    setState(() {
      _isCapturing = true;
    });

    try {
      debugPrint('Mulai proses capture image...');
      await _initializeControllerFuture;
      if (!mounted) {
        debugPrint('Widget tidak mounted, proses dibatalkan.');
        return;
      }

      await _controller
          .setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
      debugPrint('Flash mode di-set.');

      final XFile originalImage = await _controller.takePicture();
      debugPrint('Gambar berhasil diambil: ${originalImage.path}');

      final croppedImagePath =
          await _cameraService.cropImage(originalImage.path);
      debugPrint('Gambar berhasil di-crop: $croppedImagePath');

      // 4. Menggunakan Provider dengan context yang benar.
      Provider.of<ScanVM>(scaffoldContext, listen: false).fetchScan(croppedImagePath);
      debugPrint('fetchScan dipanggil.');

      _showResultsBottomSheet(scaffoldContext);
      debugPrint('Menampilkan hasil scan.');
    } catch (e) {
      debugPrint('Error capturing image: $e');
    } finally {
      if(mounted) {
        setState(() {
          _isCapturing = false;
        });
      }
    }
  }

  // 5. Fungsi ini juga menerima BuildContext yang benar.
  void _showResultsBottomSheet(BuildContext scaffoldContext) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      context: scaffoldContext,
      // 6. Menyediakan ViewModel ke BottomSheet.
      builder: (_) => ChangeNotifierProvider.value(
        value: _scanVM,
        child: ScanResultBottomSheet(),
      ),
    ).whenComplete(() {
      Provider.of<ScanVM>(scaffoldContext, listen: false).clearScan();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scanVM.dispose(); // Jangan lupa dispose ViewModel
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 7. Provider sekarang membungkus Scaffold dan menyediakan instance _scanVM.
    return ChangeNotifierProvider.value(
      value: _scanVM,
      // 8. Builder menyediakan context baru (`scaffoldContext`) yang memiliki akses ke ScanVM.
      child: Builder(builder: (scaffoldContext) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // 9. Cara yang benar untuk kembali.
                Navigator.pop(context);
              },
            ),
            title: const Text('Pindai teks'),
          ),
          body: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: CameraPreview(_controller),
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0x88000000),
                    ),
                    CameraOverlay(
                      isLatinToAksara: _isLatinToAksara,
                      onToggleLanguage: _toggleLanguage,
                      onToggleFlash: _toggleFlash,
                      // 10. Mengirimkan context yang benar ke fungsi capture.
                      onCaptureImage: () => _captureImage(scaffoldContext),
                      controller: _controller,
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
