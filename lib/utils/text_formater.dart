String formatarTexto(String texto) {
  // Regex: encontra _ que está entre letras (ou números)
  final regex = RegExp(r'(?<=[A-Za-zÀ-ÿ0-9])_(?=[A-Za-zÀ-ÿ0-9])');
  return texto.replaceAllMapped(regex, (match) => ' ');
}