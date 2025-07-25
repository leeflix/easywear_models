import 'package:easywear_models/easywear_models.dart';

enum Gender {
  women,
  men,
  diverse;

  static Gender fromString(String s) => Gender.values.firstWhere((gender) => gender.string == s);

  String uiString(Language language) => switch (this) {
        Gender.women => switch (language) {
            Language.de => 'Frauen',
            Language.en => 'Women',
            Language.fr => 'Femmes',
            Language.it => 'Donne',
            Language.es => 'Mujeres',
            Language.nl => 'Vrouwen',
            Language.ru => 'Женщины',
            Language.tr => 'Kadınlar',
            Language.no => 'Kvinner',
            Language.da => 'Kvinder',
            Language.sv => 'Kvinnor',
            Language.ar => 'نساء',
            Language.zh => '女性',
            Language.th => 'ผู้หญิง',
            Language.vi => 'Phụ nữ',
            Language.cs => 'Ženy',
            Language.el => 'Γυναίκες',
            Language.uk => 'Жінки',
            Language.hr => 'Žene',
            Language.ja => '女性',
            Language.pl => 'Kobiety',
            Language.pt => 'Mulheres',
            Language.ko => '여성',
            Language.ur => 'خواتین',
            Language.bg => 'Жени',
            Language.af => 'Vroue',
            Language.hi => 'महिलाएं',
          },
        Gender.men => switch (language) {
            Language.de => 'Männer',
            Language.en => 'Men',
            Language.fr => 'Hommes',
            Language.it => 'Uomini',
            Language.es => 'Hombres',
            Language.nl => 'Mannen',
            Language.ru => 'Мужчины',
            Language.tr => 'Erkekler',
            Language.no => 'Menn',
            Language.da => 'Mænd',
            Language.sv => 'Män',
            Language.ar => 'رجال',
            Language.zh => '男性',
            Language.th => 'ผู้ชาย',
            Language.vi => 'Đàn ông',
            Language.cs => 'Muži',
            Language.el => 'Άνδρες',
            Language.uk => 'Чоловіки',
            Language.hr => 'Muškarci',
            Language.ja => '男性',
            Language.pl => 'Mężczyźni',
            Language.pt => 'Homens',
            Language.ko => '남성',
            Language.ur => 'مرد حضرات',
            Language.bg => 'Мъже',
            Language.af => 'Mans',
            Language.hi => 'पुरुष',
          },
        Gender.diverse => switch (language) {
            Language.de => 'Divers',
            Language.en => 'Diverse',
            Language.fr => 'Divers',
            Language.it => 'Diversi',
            Language.es => 'Diversos',
            Language.nl => 'Divers',
            Language.ru => 'Разнообразные',
            Language.tr => 'Çeşitli',
            Language.no => 'Mangfoldig',
            Language.da => 'Diverse',
            Language.sv => 'Diverse',
            Language.ar => 'متنوع',
            Language.zh => '多元',
            Language.th => 'หลากหลาย',
            Language.vi => 'Đa dạng',
            Language.cs => 'Různorodé',
            Language.el => 'Διαφορετικοί',
            Language.uk => 'Різноманітні',
            Language.hr => 'Raznoliko',
            Language.ja => '多様な',
            Language.pl => 'Różnorodne',
            Language.pt => 'Diversos',
            Language.ko => '다양한',
            Language.ur => 'متنوع',
            Language.bg => 'Разнообразни',
            Language.af => 'Diverse',
            Language.hi => 'विविध',
          },
      };
}
