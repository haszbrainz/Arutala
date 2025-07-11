import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_icons.dart';
import 'item.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'dart:ui';
class FloatingNavigationBar extends StatefulWidget {
  final int initialIndex;

  const FloatingNavigationBar({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  late int _selectedIndex;

  // Daftar item navigasi Anda (pastikan rute konsisten dengan RouteNames)
  final List<Map<String, dynamic>> _navigationItems = [
    {
      'icon': Stylomateicon.home,
      'label': 'Beranda',
      'route': '/', // Atau RouteNames.home
    },
    {
      'icon': Arutalav2icon.book_type_1,
      'label': 'Belajar',
      'route': '/belajar', // Atau RouteNames.artikel
    },
    {
      'icon': Arutalav2icon.terjemah_1,
      'label': 'Translate',
      'route': '/translate', // Atau RouteNames.laporkan (sesuaikan dengan RouteNames)
    },
    {
      'icon': Stylomateicon.account,
      'label': 'Profil',
      'route': '/profil', // Atau RouteNames.profil
    },
  ];

   @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final String? currentRoute = ModalRoute.of(context)?.settings.name;
        // Jika currentRoute null (mungkin halaman awal sebelum rute bernama terdefinisi penuh),
        // fallback ke rute item pertama jika initialIndex juga 0.
        // Atau, gunakan initialIndex untuk menentukan rute awal jika currentRoute null.
        final String routeToUse = currentRoute ?? ( (widget.initialIndex < _navigationItems.length) ? _navigationItems[widget.initialIndex]['route'] as String : '/' );
        updateSelectedIndexByRoute(routeToUse);
      }
    });
  }

  void updateSelectedIndexByRoute(String route) {
    for (int i = 0; i < _navigationItems.length; i++) {
      if (_navigationItems[i]['route'] == route) {
        if (_selectedIndex != i) {
          setState(() {
            _selectedIndex = i;
          });
        }
        break;
      }
    }
  }

  void _onItemTapped(int index) {
    final String tappedRoute = _navigationItems[index]['route'] as String;
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    if (currentRoute != tappedRoute) {
      Navigator.pushReplacementNamed(context, tappedRoute);
    } else {
      if (_selectedIndex != index) {
        setState(() {
          _selectedIndex = index;
        });
      }
    }
  }

  @override
Widget build(BuildContext context) {
  // Widget pembungkus untuk efek glassmorphism
  return Positioned(
    bottom: 24, // Atur jarak dari bawah layar
    left: 24,
    right: 24,
    child: ClipRRect( // 1. ClipRRect untuk memotong blur sesuai bentuk rounded
      borderRadius: BorderRadius.circular(30.0),
      child: BackdropFilter( // 2. BackdropFilter untuk efek blur pada konten di belakangnya
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration( // 3. Dekorasi untuk tampilan kaca dan shadow
            color: Colors.white.withOpacity(0.10), // Warna dasar kaca transparan
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: CustomColors.neutral200.withOpacity(1), width: 1.0), // Garis tepi kaca
            boxShadow: [
              // 4. Shadow yang dibuat mengarah ke atas
              BoxShadow(
                color: CustomColors.neutral700.withOpacity(0.15),
                blurRadius: 30,
                offset: const Offset(0, -5), // Offset Y negatif untuk shadow di atas
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Membuat bar mengikuti lebar konten
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _navigationItems.length,
              (index) => NavigationItem(
                icon: _navigationItems[index]['icon'] as IconData,
                label: _navigationItems[index]['label'] as String,
                isActive: index == _selectedIndex,
                onTap: () => _onItemTapped(index),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  }
}
