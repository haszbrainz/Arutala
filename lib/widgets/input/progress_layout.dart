import 'package:flutter/material.dart';

class ProgressLayout extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final String title;

  const ProgressLayout({super.key,
    required this.currentPage,
    required this.totalPages,
    required this.title,
  });

  @override
  _ProgressLayoutState createState() => _ProgressLayoutState();
}

class _ProgressLayoutState extends State<ProgressLayout> {
  // Variabel untuk menyimpan nilai input TextField
  String inputValue = '';

  @override
  Widget build(BuildContext context) {
    double progress = widget.currentPage / widget.totalPages;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Header Section (Icon Arrow Back dan Progress Bar)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon Arrow Back
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFF696969)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // Progress Bar
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Color(0xFFE6E6E6),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
                  ),
                ),
              ],
            ),
          ),

          // Body Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Teks Pertanyaan
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),

                  // TextField dengan Ikon Checklist
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        inputValue = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Isi jawaban Anda',
                      suffixIcon: Icon(
                        Icons.check_circle_outline,
                        color: inputValue.isNotEmpty ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                  Spacer(), // Memastikan tombol Lanjut berada di bagian bawah
                  ElevatedButton(
                    onPressed: () {
                      if (inputValue.isNotEmpty) {
                        // Navigasi ke halaman berikutnya jika input tidak kosong
                        print("Navigasi ke halaman berikutnya");
                      } else {
                        // Tampilkan pesan error jika input kosong
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Harap isi bidang ini')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: inputValue.isNotEmpty ? Colors.blue : Colors.grey,
                      foregroundColor: inputValue.isNotEmpty ? Colors.white : Colors.black,
                    ),
                    child: Text(
                      'Lanjut',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RobotoRegular",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}