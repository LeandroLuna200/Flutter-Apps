import 'package:flutter/material.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {
  
  final String tipo;

  const ScanTiles( {@required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return Center(
      child: ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_ , i) => Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (DismissDirection direction) {
            Provider.of<ScanListProvider>(context, listen: false)
                  .borrarScanPorId(scans[i].id);
          },
          child: ListTile(
            leading: Icon( 
              this.tipo == 'http'
               ? Icons.map
               : Icons.home_outlined, 
              color: Theme.of(context).primaryColor,),
            title: Text(scans[i].valor),
            subtitle: Text(' id 1'),
            trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey,),
            onTap: () => launchURL(context, scans[i]),
          ),
        )
      ),
    );
  }
}