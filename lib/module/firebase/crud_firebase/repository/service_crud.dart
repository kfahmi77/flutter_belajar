import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_belajar/module/firebase/crud_firebase/models/data_crud.dart';

class DataFirestore {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Operasi create
  Future<void> addData(Data data) {
    CollectionReference dataCollection = firestore.collection('data');
    return dataCollection.add(data.toMap());
  }

  // Operasi read
  // Future<Map<DateTime, List<Map<String, dynamic>>>> getData(
  //     DateTime date) async {
  //   // Membuat filter berdasarkan tanggal
  //   final start = DateTime(date.year, date.month, date.day);
  //   final end = DateTime(date.year, date.month, date.day + 2);

  //   // Mengambil data dari Firestore dengan filter tanggal
  //   final querySnapshot = await firestore
  //       .collection('data')
  //       .where('tanggal', isGreaterThanOrEqualTo: start)
  //       .where('tanggal', isLessThan: end)
  //       .orderBy('tanggal')
  //       .get();

  //   // Mapping data Firestore ke dalam struktur Map yang sesuai
  //   final Map<DateTime, List<Map<String, dynamic>>> data = {};
  //   for (var doc in querySnapshot.docs) {
  //     final tanggal = (doc['tanggal'] as Timestamp).toDate();
  //     final item = {
  //       'nama': doc['nama'],
  //       'usia': doc['usia'],
  //       'tanggal': tanggal.toString(),
  //     };
  //     if (!data.containsKey(tanggal)) {
  //       data[tanggal] = [];
  //     }
  //     data[tanggal]!.add(item);
  //   }

  //   return data;
  // }

  // Operasi update
  Future<void> updateData(Data data) {
    CollectionReference dataCollection = firestore.collection('data');
    return dataCollection.doc(data.id).update(data.toMap());
  }

  // Operasi delete
  Future<void> deleteData(String id) {
    CollectionReference dataCollection = firestore.collection('data');
    return dataCollection.doc(id).delete();
  }
}
