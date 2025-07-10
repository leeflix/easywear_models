import 'package:easywear_models/easywear_models.dart';

enum Currency {
  usd_,
  jpy_,
  bgn_,
  czk_,
  dkk_,
  gbp_,
  huf_,
  pln_,
  ron_,
  sek_,
  chf_,
  isk_,
  nok_,
  try_,
  aud_,
  brl_,
  cad_,
  cny_,
  hkd_,
  idr_,
  ils_,
  inr_,
  krw_,
  mxn_,
  myr_,
  nzd_,
  php_,
  sgd_,
  thb_,
  zar_;

  String get string => toString().split(".").last.replaceAll("_", "");

  static Currency fromString(String s) =>
      Currency.values.firstWhere((v) => v.string == s);
}
