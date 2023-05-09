import 'package:flutter/material.dart';
import 'package:flutter_belajar/module/firebase/crud_firebase/models/data_crud.dart';
import 'package:flutter_belajar/module/firebase/crud_firebase/repository/service_crud.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddCrudFirebase extends StatefulWidget {
  const AddCrudFirebase({super.key});

  @override
  State<AddCrudFirebase> createState() => _AddCrudFirebaseState();
}

class _AddCrudFirebaseState extends State<AddCrudFirebase> {
  final _formKey = GlobalKey<FormState>();
  final _dataFirestore = DataFirestore();
  DateTime? _tanggal;
  String? _nama;
  int? _usia;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Data data = Data(
        tanggal: _tanggal,
        nama: _nama,
        usia: _usia,
      );
      _dataFirestore.addData(data);
      context.go('/crud-firebase');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Firebase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormField<DateTime?>(
                initialValue: _tanggal,
                builder: (FormFieldState<DateTime?> state) {
                  return InkWell(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        state.didChange(pickedDate);
                        setState(() {
                          _tanggal = pickedDate;
                        });
                      }
                    },
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Tanggal',
                        errorText: state.errorText,
                      ),
                      isEmpty: _tanggal == null,
                      child: Text(
                        _tanggal != null
                            ? DateFormat('dd MMMM yyyy').format(_tanggal!)
                            : '',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Tanggal harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    _tanggal = value;
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nama = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Usia'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Usia harus diisi';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Usia harus berupa angka';
                  }
                  return null;
                },
                onSaved: (value) {
                  _usia = int.parse(value!);
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
