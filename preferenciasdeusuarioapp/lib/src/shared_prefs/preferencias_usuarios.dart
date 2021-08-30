
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();

  }

  ///GET y SET del genero
  get genero{
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int valor) {
    _prefs.setInt('genero', valor);
  }

  ///GET y SET del _colorSecundario
  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario( bool valor) {
    _prefs.setBool('colorSecundario', valor);
  }

  ///GET y SET del _nombre
  get nombre{
    return _prefs.getString('nombre') ?? '';
  }

  set nombre( String valor) {
    _prefs.setString('nombre', valor);
  }

  ///GET y SET del ultimaPagina
  get ultimaPagina{
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina( String valor) {
    _prefs.setString('ultimaPagina', valor);
  }
}