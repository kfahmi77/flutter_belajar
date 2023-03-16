import 'package:flutter/material.dart';

class AboutDialogWidget extends StatelessWidget {
  const AboutDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => const AboutDialog(
                    applicationIcon: FlutterLogo(),
                    applicationLegalese: "App",
                    applicationName: "Flutter",
                    applicationVersion: "1.1",
                    children: [Icon(Icons.abc)],
                  ));
        },
        child: const Text("Show dialog"));
  }
}
