import 'package:easywear_models/easywear_models.dart';

enum Sort {
  random,
  highestPrice,
  lowestPrice;

  static Sort fromString(String s) => Sort.values.firstWhere((v) => v.string == s);

  String uiText(Language language) {
    switch (this) {
      case Sort.random:
        switch (language) {
          case Language.en:
            return 'Random';
          case Language.de:
            return 'Zufällig';
          case Language.fr:
            return 'Aléatoire';
          case Language.es:
            return 'Aleatorio';
          case Language.it:
            return 'Casuale';
          case Language.nl:
            return 'Willekeurig';
          case Language.pt:
            return 'Aleatório';
          case Language.ja:
            return 'ランダム';
          case Language.ko:
            return '무작위';
          case Language.zh:
            return '随机';
          case Language.ru:
            return 'Случайно';
          case Language.ar:
            return 'عشوائي';
          case Language.tr:
            return 'Rastgele';
          case Language.sv:
            return 'Slumpmässigt';
          case Language.da:
            return 'Tilfældig';
          case Language.no:
            return 'Tilfeldig';
          case Language.th:
            return 'สุ่ม';
          case Language.vi:
            return 'Ngẫu nhiên';
          case Language.cs:
            return 'Náhodně';
          case Language.el:
            return 'Τυχαίο';
          case Language.uk:
            return 'Випадково';
          case Language.hr:
            return 'Nasumično';
          case Language.pl:
            return 'Losowo';
          case Language.ur:
            return 'بے ترتیب';
          case Language.bg:
            return 'На случаен принцип';
          case Language.af:
            return 'Willekeurig';
          case Language.hi:
            return 'यादृच्छिक';
          // Add more languages as needed
        }
      case Sort.highestPrice:
        switch (language) {
          case Language.en:
            return 'Highest Price';
          case Language.de:
            return 'Höchster Preis';
          case Language.fr:
            return 'Prix le plus élevé';
          case Language.es:
            return 'Precio más alto';
          case Language.it:
            return 'Prezzo più alto';
          case Language.nl:
            return 'Hoogste prijs';
          case Language.pt:
            return 'Preço mais alto';
          case Language.ja:
            return '最高価格';
          case Language.ko:
            return '최고가';
          case Language.zh:
            return '价格最高';
          case Language.ru:
            return 'Самая высокая цена';
          case Language.ar:
            return 'أعلى سعر';
          case Language.tr:
            return 'En Yüksek Fiyat';
          case Language.sv:
            return 'Högsta pris';
          case Language.da:
            return 'Højeste pris';
          case Language.no:
            return 'Høyeste pris';
          case Language.th:
            return 'ราคาสูงสุด';
          case Language.vi:
            return 'Giá cao nhất';
          case Language.cs:
            return 'Nejvyšší cena';
          case Language.el:
            return 'Υψηλότερη τιμή';
          case Language.uk:
            return 'Найвища ціна';
          case Language.hr:
            return 'Najviša cijena';
          case Language.pl:
            return 'Najwyższa cena';
          case Language.ur:
            return 'سب سے زیادہ قیمت';
          case Language.bg:
            return 'Най-висока цена';
          case Language.af:
            return 'Hoogste prys';
          case Language.hi:
            return 'सबसे ज़्यादा कीमत';
          // Add more languages as needed
        }
      case Sort.lowestPrice:
        switch (language) {
          case Language.en:
            return 'Lowest Price';
          case Language.de:
            return 'Niedrigster Preis';
          case Language.fr:
            return 'Prix le plus bas';
          case Language.es:
            return 'Precio más bajo';
          case Language.it:
            return 'Prezzo più basso';
          case Language.nl:
            return 'Laagste prijs';
          case Language.pt:
            return 'Preço mais baixo';
          case Language.ja:
            return '最低価格';
          case Language.ko:
            return '최저가';
          case Language.zh:
            return '价格最低';
          case Language.ru:
            return 'Самая низкая цена';
          case Language.ar:
            return 'أقل سعر';
          case Language.tr:
            return 'En Düşük Fiyat';
          case Language.sv:
            return 'Lägsta pris';
          case Language.da:
            return 'Laveste pris';
          case Language.no:
            return 'Laveste pris';
          case Language.th:
            return 'ราคาต่ำสุด';
          case Language.vi:
            return 'Giá thấp nhất';
          case Language.cs:
            return 'Nejnižší cena';
          case Language.el:
            return 'Χαμηλότερη τιμή';
          case Language.uk:
            return 'Найнижча ціна';
          case Language.hr:
            return 'Najniža cijena';
          case Language.pl:
            return 'Najniższa cena';
          case Language.ur:
            return 'سب سے کم قیمت';
          case Language.bg:
            return 'Най-ниска цена';
          case Language.af:
            return 'Laagste prys';
          case Language.hi:
            return 'सबसे कम कीमत';
          // Add more languages as needed
        }
    }
  }
}
