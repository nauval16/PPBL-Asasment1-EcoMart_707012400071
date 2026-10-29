import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/favorit_provider.dart';
import '../cubits/keranjang_belanja_cubit.dart';
import 'catalog_page.dart';
import 'form_page.dart';
import 'map_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EchoMart - Beranda'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Consumer<FavoritProvider>(
                builder: (context, favProvider, child) {
                  return Text('Fav: ${favProvider.jumlahFavorit}');
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BlocBuilder<KeranjangCubit, int>(
                builder: (context, count) {
                  return Text('Cart: $count');
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'EchoMart- Produk Daur Ulang',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Komunitas Bank sampah hijau di kota bandung menghasilkan berbagai pdoduk dari pengelolaan sampah rumah tangga, seperti pupuk kompos, pot tanaman, tas daur ulang, dan kerajinan tangan',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CatalogPage()),
                );
              },
              child: const Text('Lihat Produk'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              },
              child: const Text('Form Pemesanan'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
              child: const Text('Lokasi Komunitas (Google Maps)'),
            ),
          ],
        ),
      ),
    );
  }
}
