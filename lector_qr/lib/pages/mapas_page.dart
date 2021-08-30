import 'package:flutter/material.dart';
import 'package:lector_qr/widgets/scan_tiles.dart';
// import 'package:lector_qr/providers/scan_list_provider.dart';
// import 'package:provider/provider.dart';

   class MapasPage extends StatelessWidget {
   
     @override
     Widget build(BuildContext context) {

       return ScanTiles(tipo: 'http');
       
     }
   } 