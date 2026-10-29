import 'package:flutter/foundation.dart';

class FavoritProvider extends ChangeNotifier {
  int _jumlahFavorit = 0;

  int get jumlahFavorit => _jumlahFavorit;

  void tambahFavorit() {
    _jumlahFavorit++;
    notifyListeners(); // Mengabarkan widget Consumer untuk memperbarui UI
  }
}