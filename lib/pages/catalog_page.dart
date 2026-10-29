import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product.dart';
import '../providers/favorit_provider.dart';
import '../cubits/keranjang_belanja_cubit.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  // Simpan data produk dalam List local[cite: 1, 2]
  final List<Product> _products = [
    Product(name: 'Pupuk Kompos Organik', price: 15000),
    Product(name: 'Pot Tanaman Daur Ulang', price: 25000),
    Product(name: 'Tas Kemasan Daur Ulang', price: 35000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke beranda menggunakan Navigator.pop[cite: 1]
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('Harga: Rp${product.price}'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tombol (+) dan (-) menggunakan setState()[cite: 2]
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                // Memastikan jumlah tidak kurang dari 1[cite: 2]
                                if (product.quantity > 1) {
                                  product.quantity--;
                                }
                              });
                            },
                          ),
                          Text(
                            '${product.quantity}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                product.quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Tombol Tambah Favorit (Provider)[cite: 4]
                          IconButton(
                            icon: const Icon(Icons.favorite_border, color: Colors.red),
                            onPressed: () {
                              Provider.of<FavoritProvider>(context, listen: false).tambahFavorit();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${product.name} ditambahkan ke favorit')),
                              );
                            },
                          ),
                          // Tombol Tambah Keranjang (Cubit)[cite: 4]
                          ElevatedButton(
                            onPressed: () {
                              context.read<KeranjangCubit>().tambahBarang();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${product.name} dimasukkan ke keranjang')),
                              );
                            },
                            child: const Text('+ Keranjang'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}