import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  final String? id;
  final DateTime? tanggal;
  final String? nama;
  final int? usia;

  Data({
    this.id,
    this.tanggal,
    this.nama,
    this.usia,
  });
  factory Data.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Data(
      id: doc.id,
      tanggal: data['tanggal'].toDate(),
      nama: data['nama'],
      usia: data['usia'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tanggal': tanggal,
      'nama': nama,
      'usia': usia,
    };
  }
}
