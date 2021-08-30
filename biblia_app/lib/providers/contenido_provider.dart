// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:biblia_app/models/versiculo_model.dart';

class VersiculoProvider {

  String _apikey   = 'e36fb4d33b81b6041ac311a767a6952a';
  String _url      = 'api.biblia.com';
  // String _bible    = 'RVA';
  // String _outputFormat    = '.json';

  Future<String> _procesarRespuesta(Uri url) async {

    print(url);
    final resp = await http.get(url);
    print(resp.body);
    final decodedData = json.decode(resp.body);
    print(decodedData);

    final versiculo = new Versiculo.fromJsonMap( decodedData );

    return versiculo.texto;
  }

  Future<String> getCapitulo( String reference) async {

    final url = Uri.https(
      _url, 
      'v1/bible/content/RVA.json', {
      'key'          : _apikey,
      'passage'      : reference,
      'style'        : 'orationOneVersePerLine',
    });

    return await _procesarRespuesta(url);
  }

}