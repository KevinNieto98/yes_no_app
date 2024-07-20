import 'package:flutter/material.dart';

/*
  * Para que Flutter identifique que es un color agregar antes de todo el 0xFF
  * Cuando agregamos _ al inicio de una variable, estamos indicando que es privada y que solo se puede acceder a ella desde el archivo en el que se encuentra.
*/
const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {

  final int selectedColor;

  AppTheme({ 
    this.selectedColor = 0
  }): assert(
      selectedColor >=0 && selectedColor <= _colorThemes.length, 
      'Colors must be beetwen  0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
