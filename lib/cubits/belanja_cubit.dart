import 'package:flutter_bloc/flutter_bloc.dart';

class KeranjangCubit extends Cubit<int> {
  KeranjangCubit() : super(0);

  void tambahBarang() {
    emit(state + 1);
  }

  void kurangiBarang() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}