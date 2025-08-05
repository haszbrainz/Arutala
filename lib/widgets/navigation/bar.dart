// lib/widgets/navigation/bar.dart
import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_icons.dart';
import 'package:program_arutala/widgets/navigation/item.dart'; // Widget NavigationItem kustom Anda
import 'package:program_arutala/themes/custom_colors.dart';
import 'dart:ui'; // Diperlukan untuk BackdropFilter (untuk efek glassmorphism)

// Import semua layar utama yang akan dikelola oleh FloatingNavigationBar ini
import 'package:program_arutala/views/home/home_screen.dart';
import 'package:program_arutala/views/belajar/belajar_screen.dart';
import 'package:program_arutala/views/translate/translate_screen.dart';
import 'package:program_arutala/views/profil/profil_screen.dart';

class FloatingNavigationBar extends StatefulWidget {
  final int initialIndex;

  const FloatingNavigationBar({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> with SingleTickerProviderStateMixin {
  late int _selectedIndex;
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  // Daftar item navigasi Anda (tanpa 'route' karena navigasi dikelola internal)
  final List<Map<String, dynamic>> _navigationItems = [
    {
      'icon': Stylomateicon.home,
      'label': 'Beranda',
    },
    {
      'icon': Arutalav2icon.book_type_1,
      'label': 'Belajar',
    },
    {
      'icon': Arutalav2icon.terjemah_1,
      'label': 'Translate',
    },
    {
      'icon': Stylomateicon.account,
      'label': 'Profil',
    },
  ];

  // Daftar screen yang akan ditampilkan oleh body Scaffold
  // Pastikan konstruktor screen Anda berupa `const` jika tidak ada perubahan state internal yang dinamis
  final List<Widget> _screens = const [
    HomeScreen(),
    BelajarScreen(),
    TranslateScreen(),
    ProfilScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    _animationController = AnimationController(
      vsync: this,
      // Durasi animasi diatur ke 400ms untuk kehalusan yang lebih baik
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1.0), // Mulai animasi dari bawah (luar layar)
      end: Offset.zero,           // Berakhir di posisi aslinya (terlihat di layar)
    ).animate(CurvedAnimation(
      parent: _animationController,
      // Menggunakan Curves.easeInOut untuk transisi yang lebih mulus (mempercepat di tengah, melambat di awal/akhir)
      curve: Curves.easeInOut,
    ));

    // Memicu animasi untuk memunculkan navbar saat widget diinisialisasi
    _animationController.forward();
  }

  @override
  void dispose() {
    // Pastikan AnimationController dibuang saat widget juga dibuang untuk mencegah kebocoran memori
    _animationController.dispose();
    super.dispose();
  }

  // Metode ini dipanggil saat item navigasi ditekan
  void _onItemTapped(int index) {
    // Hanya perbarui indeks yang dipilih jika ada perubahan
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index; // Perbarui indeks untuk mengganti layar di body Scaffold
      });
      // Jika Anda ingin navbar bergeser keluar dan masuk setiap kali tab berubah,
      // Anda bisa mengaktifkan kembali logika di bawah ini (opsional untuk efek tambahan):
      // _animationController.reverse().then((_) {
      //   setState(() {
      //     _selectedIndex = index;
      //   });
      //   _animationController.forward();
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body Scaffold akan menampilkan layar yang saat ini dipilih berdasarkan _selectedIndex
      body: _screens[_selectedIndex],
      // Posisi floating action button di bagian tengah bawah
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SlideTransition( // Membungkus UI navbar dengan SlideTransition untuk efek geser
        position: _animation, // Menggunakan objek animasi yang telah dibuat
        child: ClipRRect( // Memotong konten agar sesuai dengan border radius
          borderRadius: BorderRadius.circular(30.0), // Border radius yang sama dengan desain asli
          child: BackdropFilter( // Menerapkan efek blur pada konten di belakangnya (glassmorphism)
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0), // Tingkat blur yang sama dengan desain asli
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Padding internal yang sama
              decoration: BoxDecoration( // Dekorasi kontainer navbar
                color: Colors.white.withOpacity(0.10), // Warna dasar transparan yang sama
                borderRadius: BorderRadius.circular(30.0), // Border radius yang sama
                border: Border.all(color: CustomColors.neutral200.withOpacity(1), width: 1.0), // Border yang sama
                boxShadow: [ // Bayangan yang sama dengan desain asli
                  BoxShadow(
                    color: CustomColors.neutral700.withOpacity(0.15),
                    blurRadius: 30,
                    offset: const Offset(0, -5), // Offset Y negatif untuk shadow di atas
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Membuat lebar kontainer menyesuaikan konten
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Mendistribusikan item secara merata
                children: List.generate(
                  _navigationItems.length,
                  (index) => NavigationItem( // Widget NavigationItem kustom Anda
                    icon: _navigationItems[index]['icon'] as IconData,
                    label: _navigationItems[index]['label'] as String,
                    isActive: index == _selectedIndex, // Menentukan item mana yang aktif
                    onTap: () => _onItemTapped(index), // Memanggil fungsi saat item ditekan
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}