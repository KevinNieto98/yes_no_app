/* 
  ENTIDAD es un concepto o cosa que tiene 
  una identidad única y representa algo significativo 
  en el dominio del problema 
  o sistema que se está modelando o construyendo. 
*/

enum FromWho {me, hers} // *Como las interfaces en TypeScript

class Message {

  // *Declaramos las variables con su tipo
  final String text;
  final String ? imageUrl;
  final FromWho fromWho;

  // *Constructor: Como lo que recibe
  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho
  });


}
