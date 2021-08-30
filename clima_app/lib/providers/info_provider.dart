import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ClimaProvider {

  String _apikey   = '0a79ac5e3261f4d5890e442aa9c75036';
  String _url      = 'api.openweathermap.org';
  // String _bible    = 'RVA';
  // String _outputFormat    = '.json';

  Future<String> _procesarRespuesta(Uri url) async {

    print(url);
    final resp = await http.get(url);
    print(resp.body);
    final decodedData = json.decode(resp.body);
    print(decodedData);

    // final versiculo = new Versiculo.fromJsonMap( decodedData );

    // return versiculo.texto;
  }

  Future<String> getClima( String reference) async {

    final url = Uri.https(
      _url, 
      'data/2.5/onecall', {
      'appid'   : _apikey,
      'lat'     : "s", 
      'lon'     : "s",
      'exclude' : 'minutely',
      'units'   : 'metric',
      'lang'    : 'es',
    });

    return await _procesarRespuesta(url);
  }

}