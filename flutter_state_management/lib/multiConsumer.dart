import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum gioi_tinh { nam, nu }

enum bang_cap { CaoDang, DaiHoc, ThacSi, TienSi }

class GioiTinh extends ChangeNotifier {
  gioi_tinh? _gioitinh = gioi_tinh.nam;

  gioi_tinh? get gioiTinh => _gioitinh;

  set gioiTinh(gioi_tinh? value) {
    _gioitinh = value;
    notifyListeners();
  }
}

class BangCap extends ChangeNotifier {
  bang_cap? _bangCap = bang_cap.DaiHoc;

  bang_cap? get bangCap => _bangCap;

  set bangCap(bang_cap? value) {
    _bangCap = value;
    notifyListeners();
  }
}

class MyMultiConsumer extends StatelessWidget {
  const MyMultiConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Consumer'),
      ),
      body: Consumer2<GioiTinh, BangCap>(
        builder: (context, infoGioiTinh, infoBangCap, child) {
          return Column(
            children: [
              const Text('Gioi Tinh'),
              RadioListTile<gioi_tinh>(
                  value: gioi_tinh.nam,
                  title: const Text('Nam'),
                  secondary: const Icon(Icons.male),
                  groupValue: infoGioiTinh.gioiTinh,
                  onChanged: (value) {
                    infoGioiTinh.gioiTinh = value;
                  }),
              RadioListTile<gioi_tinh>(
                  value: gioi_tinh.nu,
                  title: const Text('Nu'),
                  secondary: const Icon(Icons.female),
                  groupValue: infoGioiTinh.gioiTinh,
                  onChanged: (value) {
                    infoGioiTinh.gioiTinh = value;
                  }),
              const Text('Bang Cap'),
              RadioListTile<bang_cap>(
                  value: bang_cap.CaoDang,
                  title: const Text('Cao Dang'),
                  groupValue: infoBangCap.bangCap,
                  onChanged: (value) {
                    infoBangCap.bangCap = value;
                  }),
              RadioListTile<bang_cap>(
                  value: bang_cap.DaiHoc,
                  title: const Text('Dai Hoc'),
                  groupValue: infoBangCap.bangCap,
                  onChanged: (value) {
                    infoBangCap.bangCap = value;
                  }),
              RadioListTile<bang_cap>(
                  value: bang_cap.ThacSi,
                  title: const Text('Thac Si'),
                  groupValue: infoBangCap.bangCap,
                  onChanged: (value) {
                    infoBangCap.bangCap = value;
                  }),
              RadioListTile<bang_cap>(
                  value: bang_cap.TienSi,
                  title: const Text('Tien Si'),
                  groupValue: infoBangCap.bangCap,
                  onChanged: (value) {
                    infoBangCap.bangCap = value;
                  }),
              const Divider(
                height: 100,
              ),
              Center(
                child:
                    Text('Thong tin ca nhan: ${infoGioiTinh}, ${infoBangCap}'),
              ),
            ],
          );
        },
      ),
    );
  }
}
