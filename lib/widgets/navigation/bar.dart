import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_icons.dart';
import 'package:program_arutala/widgets/navigation/item.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'dart:ui';

class FloatingNavigationBar extends StatefulWidget {
  final int initialIndex;
  // Tambahkan callback untuk mengontrol visibilitas navbar
  final ValueChanged<bool>? onVisibilityChanged;

  const FloatingNavigationBar({
    super.key,
    this.initialIndex = 0,
    this.onVisibilityChanged, // Tambahkan parameter ini
  });

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> with SingleTickerProviderStateMixin {
  late int _selectedIndex;
  // Controller untuk animasi sliding
  late AnimationController _animationController;
  // Animasi untuk nilai offset (pergeseran)
  late Animation<Offset> _animation;

  // Daftar item navigasi Anda
  final List<Map<String, dynamic>> _navigationItems = [
    {
      'icon': Stylomateicon.home,
      'label': 'Beranda',
      'route': '/',
    },
    {
      'icon': Arutalav2icon.book_type_1,
      'label': 'Belajar',
      'route': '/belajar',
    },
    {
      'icon': Arutalav2icon.terjemah_1,
      'label': 'Translate',
      'route': '/translate',
    },
    {
      'icon': Stylomateicon.account,
      'label': 'Profil',
      'route': '/profil',
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Durasi animasi geser
    );

    // Animasi bergerak dari (0, 1.0) (posisi bawah layar) ke (0, 0.0) (posisi awal)
    _animation = Tween<Offset>(
      begin: const Offset(0, 1.0), // Mulai dari luar bawah layar
      end: Offset.zero,           // Berakhir di posisi semula
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // Mulai animasi untuk memunculkan navbar saat initState
    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final String? currentRoute = ModalRoute.of(context)?.settings.name;
        final String routeToUse = currentRoute ?? ((widget.initialIndex < _navigationItems.length) ? _navigationItems[widget.initialIndex]['route'] as String : '/');
        updateSelectedIndexByRoute(routeToUse);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // Jangan lupa dispose controller
    super.dispose();
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
      // Sebelum navigasi, sembunyikan navbar dengan menganimasikan ke bawah
      _animationController.reverse().then((_) {
        // Setelah animasi selesai, baru lakukan navigasi
        Navigator.pushReplacementNamed(context, tappedRoute).then((_) {
          // Setelah navigasi selesai, tampilkan kembali navbar di layar baru
          _animationController.forward();
        });
      });
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
    return SlideTransition( // Gunakan SlideTransition untuk animasi geser
      position: _animation,
      child: Align( // Gunakan Align untuk memposisikan di bagian bawah
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24), // Sesuaikan padding
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: CustomColors.neutral200.withOpacity(1), width: 1.0),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.neutral700.withOpacity(0.15),
                      blurRadius: 30,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
        ),
      ),
    );
  }
}