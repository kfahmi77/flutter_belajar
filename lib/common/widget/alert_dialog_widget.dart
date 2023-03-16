import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('close'),
                        ),
                      ],
                      title: const Text("Alert Dialog"),
                      contentPadding: const EdgeInsets.only(left: 25, top: 8),
                      content: const Text("Isi Konten"),
                    ));
          },
          child: const Text("Alert Dialog")),
    );
  }
}
