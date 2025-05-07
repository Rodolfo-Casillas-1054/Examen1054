import 'package:flutter/material.dart';

class MiPhysicalModel extends StatelessWidget {
  const MiPhysicalModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Physical Model')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhysicalModel(
              color: Colors.transparent,
              shadowColor: Colors.black,
              elevation: 10,
              child: Image.network(
                'https://i.pinimg.com/474x/bc/ff/d2/bcffd2367ba0172a67938c958d8505bb.jpg',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 50),
            PhysicalModel(
              color: Colors.black,
              elevation: 10,
              child: Container(
                height: 150,
                width: 150,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
