import 'package:flutter/material.dart';
// import 'package:lector_qr/models/scan_model.dart';
import 'package:lector_qr/pages/direcciones_page.dart';
import 'package:lector_qr/pages/mapas_page.dart';
// import 'package:lector_qr/providers/db_provider.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/providers/ui_provider.dart';
import 'package:lector_qr/widgets/custom_navegationBar.dart';
import 'package:lector_qr/widgets/scan_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon( Icons.delete_forever), 
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false).borrarTodos();

            },
          )
        ],
      ),
      body: _HomePageBody() ,
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
      
class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    // final tempScan  = ScanModel( valor: 'https://google.com');
    // DBProvider.db.nuevoScan(tempScan);
    
    //usar el ScanListProvider
    final scanListProvider = 
                        Provider.of<ScanListProvider>(context, listen: false);

    switch( currentIndex ){

      case 0: 
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}