import 'package:flutter/material.dart';

class MiVisibility extends StatefulWidget {
  const MiVisibility({Key? key}) : super(key: key);

  @override
  State<MiVisibility> createState() => _MiVisibilityState();
}

class _MiVisibilityState extends State<MiVisibility> {
  bool isVisible = false;
  final TextStyle _style = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visibility')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: isVisible
                  ? Text(
                      'Hide',
                      style: _style,
                    )
                  : Text('Show', style: _style),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: isVisible,
              child: Image.network(
                  'https://i.pinimg.com/474x/bc/ff/d2/bcffd2367ba0172a67938c958d8505bb.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
