import 'package:flutter/material.dart';
import 'package:lector_qr/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL( BuildContext context, ScanModel scan) async {
  final url = scan.valor;

  if( scan.tipo == 'http') {
    //abrir sitio web
    if( await canLaunch(url)) {
      await launch( url );
    } else {
      throw 'No se pudo abrir $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}