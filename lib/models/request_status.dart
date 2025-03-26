import 'language.dart';

enum RequestStatus {
  inShoppingCart,
  created,
  inprogress,
  completed,
  rejected,
  canceled,
}

extension RequestStatusExt on RequestStatus {
  String get string => toString().split(".").last;

  static RequestStatus fromString(String s) =>
      RequestStatus.values.firstWhere((e) => e.string == s);

  String uiText(Language currentLanguage) {
    switch (this) {
      case RequestStatus.created:
        return switch (currentLanguage) {
          Language.de => "Neu",
          Language.en => "New",
          Language.fr => "Nouveau",
          Language.it => "Nuovo",
          Language.es => "Nuevo",
          Language.nl => "Nieuw",
          Language.ru => "Новый",
          Language.tr => "Yeni",
          Language.no => "Ny",
          Language.da => "Ny",
          Language.sv => "Ny",
          Language.ar => "جديد",
          Language.zh => "新",
          Language.th => "ใหม่",
          Language.vi => "Mới",
          Language.cs => "Nový",
          Language.el => "Νέο",
          Language.uk => "Новий",
          Language.hr => "Novo",
          Language.ja => "新",
          Language.pl => "Nowy",
          Language.pt => "Novo",
          Language.ko => "새로운",
          Language.ur => "نیا",
          Language.bg => "Нов",
          Language.af => "Nuwe",
          Language.hi => "नया",
        };
      case RequestStatus.inprogress:
        return switch (currentLanguage) {
          Language.de => "In Bearbeitung",
          Language.en => "In progress",
          Language.fr => "En cours",
          Language.it => "In corso",
          Language.es => "En progreso",
          Language.nl => "In behandeling",
          Language.ru => "В процессе",
          Language.tr => "Devam ediyor",
          Language.no => "Pågår",
          Language.da => "Under behandling",
          Language.sv => "Pågående",
          Language.ar => "قيد التقدم",
          Language.zh => "进行中",
          Language.th => "กำลังดำเนินการ",
          Language.vi => "Đang tiến hành",
          Language.cs => "Probíhá",
          Language.el => "Σε εξέλιξη",
          Language.uk => "В процесі",
          Language.hr => "U tijeku",
          Language.ja => "進行中",
          Language.pl => "W trakcie",
          Language.pt => "Em progresso",
          Language.ko => "진행 중",
          Language.ur => "جاری",
          Language.bg => "В процес на",
          Language.af => "In behandeling",
          Language.hi => "काम में",
        };
      case RequestStatus.completed:
        return switch (currentLanguage) {
          Language.de => "Abgeschlossen",
          Language.en => "Completed",
          Language.fr => "Terminé",
          Language.it => "Completato",
          Language.es => "Completado",
          Language.nl => "Voltooid",
          Language.ru => "Завершено",
          Language.tr => "Tamamlandı",
          Language.no => "Fullført",
          Language.da => "Afsluttet",
          Language.sv => "Avslutad",
          Language.ar => "منجز",
          Language.zh => "已完成",
          Language.th => "เสร็จสิ้น",
          Language.vi => "Đã hoàn thành",
          Language.cs => "Dokončeno",
          Language.el => "Ολοκληρώθηκε",
          Language.uk => "Завершено",
          Language.hr => "Završeno",
          Language.ja => "完了",
          Language.pl => "Zakończony",
          Language.pt => "Concluído",
          Language.ko => "완료",
          Language.ur => "مکمل",
          Language.bg => "Завършен",
          Language.af => "Voltooid",
          Language.hi => "पूरा हुआ",
        };
      case RequestStatus.rejected:
        return switch (currentLanguage) {
          Language.de => "Abgelehnt",
          Language.en => "Rejected",
          Language.fr => "Rejeté",
          Language.it => "Rifiutato",
          Language.es => "Rechazado",
          Language.nl => "Afgewezen",
          Language.ru => "Отклонено",
          Language.tr => "Reddedildi",
          Language.no => "Avvist",
          Language.da => "Afvist",
          Language.sv => "Avvisad",
          Language.ar => "مرفوض",
          Language.zh => "被拒绝",
          Language.th => "ปฏิเสธ",
          Language.vi => "Từ chối",
          Language.cs => "Odmítnuto",
          Language.el => "Απορρίφθηκε",
          Language.uk => "Відхилений",
          Language.hr => "Odbijeno",
          Language.ja => "拒否されました",
          Language.pl => "Odrzucone",
          Language.pt => "Rejeitado",
          Language.ko => "거부됨",
          Language.ur => "منسوخ",
          Language.bg => "Отхвърлен",
          Language.af => "Geweier",
          Language.hi => "अस्वीकृत",
        };
      case RequestStatus.canceled:
        return switch (currentLanguage) {
          Language.de => "Storniert",
          Language.en => "Canceled",
          Language.fr => "Annulé",
          Language.it => "Annullato",
          Language.es => "Cancelado",
          Language.nl => "Geannuleerd",
          Language.ru => "Отменено",
          Language.tr => "İptal edildi",
          Language.no => "Avbrutt",
          Language.da => "Annulleret",
          Language.sv => "Avbruten",
          Language.ar => "ملغى",
          Language.zh => "取消",
          Language.th => "ยกเลิก",
          Language.vi => "Đã hủy",
          Language.cs => "Zrušeno",
          Language.el => "Ακυρώθηκε",
          Language.uk => "Скасовано",
          Language.hr => "Otkazano",
          Language.ja => "キャンセルされました",
          Language.pl => "Anulowane",
          Language.pt => "Cancelado",
          Language.ko => "취소됨",
          Language.ur => "منسوخ",
          Language.bg => "Отказано",
          Language.af => "Gekanselleer",
          Language.hi => "रद्द किया गया",
        };
      case RequestStatus.inShoppingCart:
        return switch (currentLanguage) {
          Language.de => "Im Einkaufswagen",
          Language.en => "In the shopping cart",
          Language.fr => "Dans le panier",
          Language.it => "Nel carrello",
          Language.es => "En el carrito",
          Language.nl => "In de winkelwagen",
          Language.ru => "В корзине",
          Language.tr => "Sepette",
          Language.no => "I handlekurven",
          Language.da => "I indkøbskurven",
          Language.sv => "I varukorgen",
          Language.ar => "في سلة التسوق",
          Language.zh => "在购物车中",
          Language.th => "ในตะกร้า",
          Language.vi => "Trong giỏ hàng",
          Language.cs => "V nákupním košíku",
          Language.el => "Στο καλάθι αγορών",
          Language.uk => "У кошику",
          Language.hr => "U košarici",
          Language.ja => "ショッピングカートに",
          Language.pl => "W koszyku",
          Language.pt => "No carrinho de compras",
          Language.ko => "장바구니에",
          Language.ur => "خریداری کرنے والے میں",
          Language.bg => "В кошницата за пазаруване",
          Language.af => "In die inkopiesmandjie",
          Language.hi => "खरीदारी करने वाले में",
        };
    }
  }
}
