import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
// import 'package:program_arutala/widgets/navigation/bar.dart';
import 'package:program_arutala/widgets/card/card.dart'; // Impor kartu yang sudah diupdate
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:program_arutala/views/translate/scan_screen.dart'; // Impor halaman kamera
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _bannerPageController = PageController();

  final List<String> bannerImagePaths = [
    'asset/images/aksara_jawa.png',
    'asset/images/aksara_bali.png',
    'asset/images/aksara_sunda.png',
  ];

  // Data dummy untuk GridView
  final List<Map<String, String>> featureData = [
    {
      'icon': 'asset/images/image_83.png', // Path gambar ikon
      'title': 'Praktik',
      'subtitle': 'Mulai menulis langsung',
      'background':
          'asset/images/bg-frame.png' // Ganti dengan path background Anda
    },
    {
      'icon': 'asset/images/image_82.png',
      'title': 'Latihan',
      'subtitle': 'Mulai latihan langsung',
      'background':
          'asset/images/bg-frame1.png' // Ganti dengan path background Anda
    },
    {
      'icon': 'asset/images/image_84.png',
      'title': 'Tantangan',
      'subtitle': 'Mulai Tantangan langsung',
      'background':
          'asset/images/bg-frame1.png' // Ganti dengan path background Anda
    },
    {
      'icon': 'asset/images/Group_269.png',
      'title': 'Scan',
      'subtitle': 'Mulai Terjemah',
      'background':
          'asset/images/bg-frame1.png' // Ganti dengan path background Anda
    },
  ];

  @override
  void dispose() {
    _bannerPageController.dispose();
    super.dispose();
  }

  // --- LOGIKA BARU DIMULAI DI SINI ---

  // 1. Fungsi untuk menampilkan dialog "Dalam Pengembangan" (VERSI BARU)
  void _showDevelopmentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Menggunakan Dialog untuk kontrol penuh atas tampilan
        return Dialog(
          backgroundColor:
              Colors.transparent, // Membuat background bawaan transparan
          elevation: 0,
          child: Container(
            width: 240,
            height: 240,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar GIF (ganti path sesuai kebutuhan)
                Image.asset(
                  'asset/images/Arutala_Pengembangan.gif', // GANTI PATH INI
                  height: 120,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.code_off,
                      size: 60,
                      color: CustomColors.neutral400),
                ),

                // Teks
                Text(
                  'Fitur Sedang Dalam Pengembangan',
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.semiboldBase
                      .copyWith(color: CustomColors.neutral700),
                ),

                // Tombol Kembali
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF2196F3), // Warna biru dari gambar
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Kembali',
                      style: CustomTextStyles.semiboldSm
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 2. Fungsi untuk navigasi ke halaman kamera
  void _navigateToCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScanScreen()),
    );
  }

  // --- AKHIR LOGIKA BARU ---

  @override
  Widget build(BuildContext context) {
    // Ambil nama pengguna dari Supabase (user metadata 'full_name'); fallback ke default
    final user = Supabase.instance.client.auth.currentUser;
    final String displayName =
        ((user?.userMetadata?['full_name'] as String?)?.trim().isNotEmpty ==
                true)
            ? (user?.userMetadata?['full_name'] as String)
            : 'Budiono Siregar';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage('asset/images/profil_budiono.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai',
                          style: CustomTextStyles.regularBase
                              .copyWith(color: CustomColors.neutral600),
                        ),
                        Text(
                          displayName,
                          style: CustomTextStyles.boldLg
                              .copyWith(color: CustomColors.neutral900),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.notifications_none_outlined,
                        color: CustomColors.neutral700, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 140,
              child: PageView.builder(
                controller: _bannerPageController,
                itemCount: bannerImagePaths.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        bannerImagePaths[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: CustomColors.neutral100,
                            child: const Center(
                              child: Icon(Icons.image_not_supported_outlined,
                                  color: CustomColors.neutral400, size: 40),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: _bannerPageController,
              count: bannerImagePaths.length,
              effect: WormEffect(
                dotHeight: 8.0,
                dotWidth: 8.0,
                activeDotColor: CustomColors.secondary500,
                dotColor: CustomColors.neutral200,
              ),
            ),
            const SizedBox(height: 12),

            // --- GRIDVIEW DIMULAI DI SINI ---
            GridView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: featureData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20, // Jarak horizontal
                mainAxisSpacing: 20, // Jarak vertikal
                childAspectRatio:
                    181 / 240, // Rasio aspek agar kartu lebih tinggi
              ),
              itemBuilder: (context, index) {
                final item = featureData[index];
                return GridItemCard(
                  iconPath: item['icon']!,
                  title: item['title']!,
                  subtitle: item['subtitle']!,
                  backgroundImagePath: item['background']!,
                  // --- LOGIKA PADA onTap ---
                  onTap: () {
                    // Cek judul kartu untuk menentukan aksi
                    if (item['title'] == 'Scan') {
                      _navigateToCamera();
                    } else {
                      _showDevelopmentDialog();
                    }
                  },
                );
              },
            ),
            // --- AKHIR GRIDVIEW ---

            const SizedBox(height: 100),
          ],
        ),
      ),
      // floatingActionButton: const FloatingNavigationBar(initialIndex: 0),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
