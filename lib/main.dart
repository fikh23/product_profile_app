import 'package:flutter/material.dart';

void main() {
  runApp(const ProductProfileApp());
}

class ProductProfileApp extends StatelessWidget {
  const ProductProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPM Sesi 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5FAF9),
      ),
      home: const ProductProfilePage(),
    );
  }
}

class ProductProfilePage extends StatelessWidget {
  const ProductProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PPM Sesi 2 - Fikri Zakaria (20240040067)',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileCard(),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}

// KARTU PROFIL MAHASISWA
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundColor: Color(0xFFB2DFDB),
              child: Icon(
                Icons.person,
                size: 45,
                color: Color(0xFF00695C),
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fikri Zakaria',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('NIM: 20240040067'),
                  Text('Prodi: Teknik Informatika'),
                  Text('Kelas: TI24B'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// KARTU PRODUK
class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  int likeCount = 0;
  int quantity = 1;

  final String productName = 'Headphone Bluetooth';
  final int productPrice = 150000;
  final String productCategory = 'Elektronik';

  String formatRupiah(int price) {
    final String formatted = price.toString().replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => '.',
        );
    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    final int totalPrice = productPrice * quantity;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // GAMBAR PRODUK
          Container(
            height: 180,
            color: const Color(0xFFE0F2F1),
            child: const Icon(
              Icons.headphones,
              size: 100,
              color: Colors.teal,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAMA PRODUK
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // HARGA PRODUK
                Text(
                  formatRupiah(productPrice),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Kategori: $productCategory'),

                const SizedBox(height: 12),

                // BANNER PROMO
                SizedBox(
                  height: 75,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const Positioned(
                        left: 14,
                        top: 20,
                        child: Icon(
                          Icons.local_offer,
                          color: Colors.deepOrange,
                          size: 30,
                        ),
                      ),
                      const Positioned(
                        left: 54,
                        top: 12,
                        right: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PROMO SPESIAL!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Belanja sekarang, jangan sampai terlewat!',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // FAVORIT, LIKE, DAN JUMLAH
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Favorit',
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          likeCount += isFavorite ? 1 : -1;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 30,
                      ),
                    ),
                    Text('$likeCount Like'),
                    const Spacer(),
                    const Text('Jumlah:'),
                    IconButton(
                      tooltip: 'Kurangi jumlah',
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                      ),
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Tambah jumlah',
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),

                // TOTAL HARGA
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Harga:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formatRupiah(totalPrice),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // TOMBOL KERANJANG
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '$productName sebanyak $quantity '
                            'berhasil ditambahkan ke keranjang.',
                          ),
                          backgroundColor: Colors.teal,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Tambah ke Keranjang'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}