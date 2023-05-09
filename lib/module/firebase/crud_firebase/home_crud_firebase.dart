import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'models/data_crud.dart';

class DataListScreen extends StatefulWidget {
  const DataListScreen({super.key});

  @override
  createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  late Stream<List<Data>> _streamData;

  @override
  void initState() {
    super.initState();
    _streamData = FirebaseFirestore.instance
        .collection('data')
        .orderBy('tanggal', descending: false) // tambahkan orderBy disini
        .snapshots()
        .map((querySnapshot) =>
            querySnapshot.docs.map((doc) => Data.fromFirestore(doc)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _streamData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final groupedData = groupBy(snapshot.data!,
                (data) => DateFormat('yyyy-MM-dd').format(data.tanggal!));
            final keys = groupedData.keys.toList()
              ..sort((a, b) => b.compareTo(a));
            return ListView.builder(
              itemCount: groupedData.length,
              itemBuilder: (context, index) {
                final key = keys[index];
                final values = groupedData[key];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        key,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: values!.length,
                      itemBuilder: (context, index) {
                        final data = values[index];
                        return ListTile(
                          title: Text(data.nama!),
                          subtitle: Text('Usia: ${data.usia}'),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text('Data Kosong'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.go('/crud-add-firebase'),
      ),
    );
  }
}
