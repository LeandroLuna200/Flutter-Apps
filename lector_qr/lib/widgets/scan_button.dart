import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon( Icons.filter_center_focus_sharp),
      onPressed: () async{
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    '#00b347', 
                                                    'Cancelar', 
                                                    false, 
                                                    ScanMode.QR);

        // final barcodeScanRes = 'http:77asd';
        // final barcodeScanRes = 'geo:-34.6087024,-58.3733001';
        
        if( barcodeScanRes == '-1' ) {
          return;
        }

        final scanListProvider = 
                    Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        launchURL(context, nuevoScan);
      }
    );
  }
}