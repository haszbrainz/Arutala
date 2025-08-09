import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
import 'package:program_arutala/routes/name_routes.dart';

class LatihanSoalScreen extends StatefulWidget {
  const LatihanSoalScreen({super.key});

  @override
  State<LatihanSoalScreen> createState() => _LatihanSoalScreenState();
}

// Enum untuk merepresentasikan status jawaban
enum AnswerStatus { none, correct, incorrect }

class _LatihanSoalScreenState extends State<LatihanSoalScreen> {
  String? _selectedAnswer;
  AnswerStatus _answerStatus = AnswerStatus.none;
  // Gunakan path gambar sebagai jawaban yang benar
  final String _correctAnswer = 'asset/images/NA.png';

  // Pilihan jawaban berupa gambar
  final List<String> _options = [
    'asset/images/NYA.png',
    'asset/images/NA.png',
    'asset/images/TA.png',
    'asset/images/YA.png',
  ];

  void _checkAnswer() {
    setState(() {
      if (_selectedAnswer == _correctAnswer) {
        _answerStatus = AnswerStatus.correct;
      } else {
        _answerStatus = AnswerStatus.incorrect;
      }
    });
    _showFeedbackBottomSheet();
  }

  void _resetState() {
    setState(() {
      _selectedAnswer = null;
      _answerStatus = AnswerStatus.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text('Soal 1',
                  style: CustomTextStyles.semiboldLg
                      .copyWith(color: CustomColors.primary500)),
              const SizedBox(height: 8),
              Text('Huruf Aksara apakah yang digunakan untuk menuliskan "Na"?',
                  style: CustomTextStyles.bold2xl),
              const SizedBox(height: 24),
              Text('Pilih jawaban',
                  style: CustomTextStyles.semiboldLg
                      .copyWith(color: CustomColors.neutral500)),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: _options.length,
                  itemBuilder: (context, index) {
                    final option = _options[index];
                    return _ChoiceCard(
                      imagePath: option,
                      isSelected: _selectedAnswer == option,
                      status: _answerStatus,
                      isCorrectChoice: option == _correctAnswer,
                      onTap: () {
                        if (_answerStatus == AnswerStatus.none) {
                          setState(() {
                            _selectedAnswer = option;
                          });
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // Tombol "Periksa" hanya muncul sebelum jawaban diperiksa
      bottomNavigationBar:
          _answerStatus == AnswerStatus.none ? _buildCheckButton() : null,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close, color: CustomColors.neutral400),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const LinearProgressIndicator(
          value: 0.2, // Progress setelah intro
          minHeight: 10,
          backgroundColor: CustomColors.neutral200,
          valueColor: AlwaysStoppedAnimation<Color>(CustomColors.primary500),
        ),
      ),
    );
  }

  Widget _buildCheckButton() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ElevatedButton(
        onPressed: _selectedAnswer == null ? null : _checkAnswer,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.primary500,
          disabledBackgroundColor: CustomColors.neutral200,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text('Periksa',
            style: CustomTextStyles.semiboldBase.copyWith(color: Colors.white)),
      ),
    );
  }

  void _showFeedbackBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: _answerStatus == AnswerStatus.correct
          ? Colors.green.shade100
          : Colors.red.shade100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final isCorrect = _answerStatus == AnswerStatus.correct;
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  // Ganti dengan gambar dari asset jika ada
                  Icon(
                    isCorrect ? Icons.check_circle : Icons.cancel,
                    color: isCorrect ? Colors.green : Colors.red,
                    size: 32,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      isCorrect ? 'Luar biasa!' : 'Jawabanmu salah. Coba lagi.',
                      style: CustomTextStyles.boldLg.copyWith(
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {}, // TODO: Implement flag/report logic
                    icon: Icon(
                      Icons.flag_outlined,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Tutup bottom sheet
                    if (isCorrect) {
                      // Arahkan ke halaman berhasil
                      Navigator.pushReplacementNamed(
                        context,
                        RouteNames.berhasilLatihan,
                      );
                    } else {
                      _resetState(); // Ulangi soal
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCorrect ? Colors.green : Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    isCorrect ? 'Selanjutnya' : 'Coba lagi',
                    style: CustomTextStyles.semiboldBase
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Widget untuk kartu pilihan jawaban
class _ChoiceCard extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final AnswerStatus status;
  final bool isCorrectChoice;
  final VoidCallback onTap;

  const _ChoiceCard({
    required this.imagePath,
    required this.isSelected,
    required this.status,
    required this.isCorrectChoice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor;
    final Color backgroundColor;

    if (status != AnswerStatus.none && isSelected) {
      // Setelah diperiksa dan ini adalah pilihan user
      borderColor = status == AnswerStatus.correct ? Colors.green : Colors.red;
      backgroundColor = status == AnswerStatus.correct
          ? Colors.green.shade50
          : Colors.red.shade50;
    } else if (status != AnswerStatus.none && isCorrectChoice) {
      // Setelah diperiksa dan ini adalah jawaban yang benar (tapi bukan pilihan user)
      borderColor = Colors.green;
      backgroundColor = Colors.green.shade50;
    } else if (isSelected) {
      // Sebelum diperiksa dan sedang dipilih
      borderColor = CustomColors.primary500;
      backgroundColor = CustomColors.primary100;
    } else {
      // State default
      borderColor = CustomColors.neutral200;
      backgroundColor = Colors.white;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Builder(
              builder: (context) {
                final dpr = MediaQuery.of(context).devicePixelRatio;
                // Target tampilan 120x120, turunkan ukuran decode sesuai DPR untuk hemat memori/GPU
                final target = (120 * dpr).round();
                return Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: 120,
                  height: 120,
                  cacheWidth: target,
                  cacheHeight: target,
                  filterQuality: FilterQuality.low,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.image_not_supported,
                    size: 48,
                    color: CustomColors.neutral400,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
