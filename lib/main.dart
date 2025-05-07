import 'package:flutter/material.dart';
import 'package:examen1054/pantallainicial.dart';
import 'package:examen1054/gridview.dart';
import 'package:examen1054/text.dart';
import 'package:examen1054/listwheelscrollview.dart';
import 'package:examen1054/transform.dart';
import 'package:examen1054/datatable.dart';
import 'package:examen1054/showsearch.dart';
import 'package:examen1054/spacer.dart';
import 'package:examen1054/physicalmodel.dart';
import 'package:examen1054/visibility.dart';

void main() => runApp(const MiRutas());

class MiRutas extends StatelessWidget {
  const MiRutas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutas entre paginas',
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaI(titulo: 'Pantalla Principal'),
        '/gridview': (context) => const MiGridView(),
        '/textstyle': (context) => const MiTextStyle(),
        '/listscroll': (context) => const MiListWheelScrollView(),
        '/transform': (context) => const MiTransform(),
        '/datatable': (context) => const MiDataTable(),
        '/showsearch': (context) => const MiShowSearch(),
        '/spacer': (context) => const MiSpacer(),
        '/physicalmodel': (context) => const MiPhysicalModel(),
        '/visibility': (context) => const MiVisibility(),
      },
    );
  }
}
