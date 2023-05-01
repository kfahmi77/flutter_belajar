import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CobaWidget extends StatefulWidget {
  const CobaWidget({super.key});

  @override
  createState() => _CobaWidgetState();
}

class _CobaWidgetState extends State<CobaWidget> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  bool _isImageSelected = false;
  var _isStoragePermissionGranted = false;
  bool get isStoragePermissionGranted => _isStoragePermissionGranted;

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  Future<void> checkPermission() async {
    final PermissionStatus status = await Permission.storage.status;
    if (status == await Permission.storage.isGranted) {
      _isStoragePermissionGranted = true;
      return;
    } else {
      final PermissionStatus result = await Permission.storage.request();
      _isStoragePermissionGranted = result == PermissionStatus.granted;
    }
  }

  Future<void> getImage(ImageSource source) async {
    final PermissionStatus status = await Permission.photos.request();

    if (status != PermissionStatus.granted) {
      return;
    }

    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isImageSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 150,
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.camera),
                            title: const Text("Take a photo"),
                            onTap: () {
                              getImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_album),
                            title: const Text("Choose from gallery"),
                            onTap: () {
                              getImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  image: _isImageSelected
                      ? DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _isImageSelected
                    ? null
                    : Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey[600],
                      ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "John Doe",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "john.doe@example.com",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
