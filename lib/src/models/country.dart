import 'package:easywear_models/easywear_models.dart';

enum Country {
  af_,
  eg_,
  al_,
  dz_,
  ad_,
  ao_,
  ag_,
  gq_,
  ar_,
  am_,
  az_,
  et_,
  au_,
  bs_,
  bh_,
  bd_,
  bb_,
  by_,
  be_,
  bz_,
  bj_,
  bt_,
  bo_,
  ba_,
  bw_,
  br_,
  bn_,
  bg_,
  bf_,
  bi_,
  cv_,
  cl_,
  cn_,
  ck_,
  cr_,
  ci_,
  dk_,
  de_,
  dm_,
  do_,
  dj_,
  ec_,
  sv_,
  er_,
  ee_,
  sz_,
  fj_,
  fi_,
  fr_,
  ga_,
  gm_,
  ge_,
  gh_,
  gd_,
  gr_,
  gt_,
  gn_,
  gw_,
  gy_,
  ht_,
  va_,
  hn_,
  in_,
  id_,
  iq_,
  ir_,
  ie_,
  is_,
  il_,
  it_,
  jm_,
  jp_,
  ye_,
  jo_,
  kh_,
  cm_,
  ca_,
  kz_,
  qa_,
  ke_,
  kg_,
  ki_,
  co_,
  km_,
  cg_,
  cd_,
  kp_,
  kr_,
  xk_,
  hr_,
  cu_,
  kw_,
  la_,
  ls_,
  lv_,
  lb_,
  lr_,
  ly_,
  li_,
  lt_,
  lu_,
  mg_,
  mw_,
  my_,
  mv_,
  ml_,
  mt_,
  ma_,
  mh_,
  mr_,
  mu_,
  mx_,
  fm_,
  md_,
  mc_,
  mn_,
  me_,
  mz_,
  mm_,
  na_,
  nr_,
  np_,
  nz_,
  ni_,
  nl_,
  ne_,
  ng_,
  nu_,
  mk_,
  no_,
  om_,
  at_,
  pk_,
  pw_,
  pa_,
  pg_,
  py_,
  pe_,
  ph_,
  pl_,
  pt_,
  rw_,
  ro_,
  ru_,
  sb_,
  zm_,
  ws_,
  sm_,
  st_,
  sa_,
  se_,
  ch_,
  sn_,
  rs_,
  sc_,
  sl_,
  zw_,
  sg_,
  sk_,
  si_,
  so_,
  es_,
  lk_,
  kn_,
  lc_,
  vc_,
  za_,
  sd_,
  ss_,
  sr_,
  sy_,
  tj_,
  tz_,
  th_,
  tl_,
  tg_,
  to_,
  tt_,
  td_,
  cz_,
  tn_,
  tr_,
  tm_,
  tv_,
  ug_,
  ua_,
  hu_,
  uy_,
  uz_,
  vu_,
  ve_,
  ae_,
  us_,
  gb_,
  vn_,
  cf_,
  cy_;

  String get string => toString().split(".").last.replaceAll("_", "");

  static Country fromString(String s) => Country.values.firstWhere((country) => country.string == s);

  Currency get currency => switch (this) {
        Country.au_ || Country.ki_ || Country.nr_ || Country.tv_ => Currency.aud_,
        Country.bs_ || Country.ec_ || Country.sv_ || Country.mh_ || Country.fm_ || Country.pw_ || Country.pa_ || Country.zw_ || Country.tl_ || Country.us_ => Currency.usd_,
        Country.bg_ => Currency.bgn_,
        Country.br_ => Currency.brl_,
        Country.ca_ => Currency.cad_,
        Country.li_ || Country.ch_ => Currency.chf_,
        Country.cn_ => Currency.cny_,
        Country.cz_ => Currency.czk_,
        Country.dk_ => Currency.dkk_,
        Country.gb_ => Currency.gbp_,
        Country.hu_ => Currency.huf_,
        Country.id_ => Currency.idr_,
        Country.il_ => Currency.ils_,
        Country.in_ => Currency.inr_,
        Country.is_ => Currency.isk_,
        Country.jp_ => Currency.jpy_,
        Country.kr_ => Currency.krw_,
        Country.mx_ => Currency.mxn_,
        Country.my_ => Currency.myr_,
        Country.no_ => Currency.nok_,
        Country.ck_ || Country.nz_ || Country.nu_ => Currency.nzd_,
        Country.ph_ => Currency.php_,
        Country.pl_ => Currency.pln_,
        Country.ro_ => Currency.ron_,
        Country.se_ => Currency.sek_,
        Country.sg_ => Currency.sgd_,
        Country.th_ => Currency.thb_,
        Country.tr_ => Currency.try_,
        Country.za_ => Currency.zar_,

        // TODO: Handle this case.
        Country.af_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.eg_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.al_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.dz_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ad_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ao_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ag_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.gq_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ar_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.am_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.az_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.et_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bh_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bd_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bb_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.by_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.be_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bz_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bj_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bt_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bo_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ba_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bw_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bn_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bf_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.bi_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.cv_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.cl_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.cr_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ci_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.de_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.dm_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.do_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.dj_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.er_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ee_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sz_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.fj_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.fi_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.fr_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ga_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.gm_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ge_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.gh_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.gd_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.gr_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.gt_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.gn_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.gw_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.gy_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ht_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.va_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.hn_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.iq_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ir_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ie_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.it_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.jm_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ye_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.jo_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.kh_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.cm_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.kz_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.qa_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ke_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.kg_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.co_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.km_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.cg_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.cd_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.kp_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.xk_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.hr_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.cu_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.kw_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.la_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ls_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.lv_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.lb_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.lr_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ly_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.lt_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.lu_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mg_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mw_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mv_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ml_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mt_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ma_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mr_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mu_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.md_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mc_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mn_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.me_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mz_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mm_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.na_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.np_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ni_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.nl_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ne_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ng_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.mk_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.om_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.at_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.pk_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.pg_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.py_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.pe_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.pt_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.rw_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ru_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sb_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.zm_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ws_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sm_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.st_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sa_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sn_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.rs_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sc_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sl_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sk_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.si_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.so_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.es_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.lk_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.kn_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.lc_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.vc_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sd_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ss_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sr_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.sy_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.tj_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.tz_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.tg_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.to_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.tt_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.td_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.tn_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.tm_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ug_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ua_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.uy_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.uz_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.vu_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ve_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.ae_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.vn_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.cf_ => throw UnimplementedError(),
        // TODO: Handle this case.
        Country.cy_ => throw UnimplementedError(),
      };

  String get uiString => switch (this) {
        Country.af_ => 'Afghanistan',
        Country.eg_ => 'Egypt',
        Country.al_ => 'Albania',
        Country.dz_ => 'Algeria',
        Country.ad_ => 'Andorra',
        Country.ao_ => 'Angola',
        Country.ag_ => 'Antigua and Barbuda',
        Country.gq_ => 'Equatorial Guinea',
        Country.ar_ => 'Argentina',
        Country.am_ => 'Armenia',
        Country.az_ => 'Azerbaijan',
        Country.et_ => 'Ethiopia',
        Country.au_ => 'Australia',
        Country.bs_ => 'Bahamas',
        Country.bh_ => 'Bahrain',
        Country.bd_ => 'Bangladesh',
        Country.bb_ => 'Barbados',
        Country.by_ => 'Belarus',
        Country.be_ => 'Belgium',
        Country.bz_ => 'Belize',
        Country.bj_ => 'Benin',
        Country.bt_ => 'Bhutan',
        Country.bo_ => 'Bolivia',
        Country.ba_ => 'Bosnia and Herzegovina',
        Country.bw_ => 'Botswana',
        Country.br_ => 'Brazil',
        Country.bn_ => 'Brunei Darussalam',
        Country.bg_ => 'Bulgaria',
        Country.bf_ => 'Burkina Faso',
        Country.bi_ => 'Burundi',
        Country.cv_ => 'Cabo Verde',
        Country.cl_ => 'Chile',
        Country.cn_ => 'China',
        Country.ck_ => 'Cook Islands',
        Country.cr_ => 'Costa Rica',
        Country.ci_ => 'Cote d\'Ivoire',
        Country.dk_ => 'Denmark',
        Country.de_ => 'Germany',
        Country.dm_ => 'Dominica',
        Country.do_ => 'Dominican Republic',
        Country.dj_ => 'Djibouti',
        Country.ec_ => 'Ecuador',
        Country.sv_ => 'El Salvador',
        Country.er_ => 'Eritrea',
        Country.ee_ => 'Estonia',
        Country.sz_ => 'Eswatini',
        Country.fj_ => 'Fiji',
        Country.fi_ => 'Finland',
        Country.fr_ => 'France',
        Country.ga_ => 'Gabon',
        Country.gm_ => 'Gambia',
        Country.ge_ => 'Georgia',
        Country.gh_ => 'Ghana',
        Country.gd_ => 'Grenada',
        Country.gr_ => 'Greece',
        Country.gt_ => 'Guatemala',
        Country.gn_ => 'Guinea',
        Country.gw_ => 'Guinea-Bissau',
        Country.gy_ => 'Guyana',
        Country.ht_ => 'Haiti',
        Country.va_ => 'Holy See',
        Country.hn_ => 'Honduras',
        Country.in_ => 'India',
        Country.id_ => 'Indonesia',
        Country.iq_ => 'Iraq',
        Country.ir_ => 'Iran (Islamic Republic of)',
        Country.ie_ => 'Ireland',
        Country.is_ => 'Iceland',
        Country.il_ => 'Israel',
        Country.it_ => 'Italy',
        Country.jm_ => 'Jamaica',
        Country.jp_ => 'Japan',
        Country.ye_ => 'Yemen',
        Country.jo_ => 'Jordan',
        Country.kh_ => 'Cambodia',
        Country.cm_ => 'Cameroon',
        Country.ca_ => 'Canada',
        Country.kz_ => 'Kazakhstan',
        Country.qa_ => 'Qatar',
        Country.ke_ => 'Kenya',
        Country.kg_ => 'Kyrgyzstan',
        Country.ki_ => 'Kiribati',
        Country.co_ => 'Colombia',
        Country.km_ => 'Comoros',
        Country.cg_ => 'Congo',
        Country.cd_ => 'Congo (Democratic Republic of the)',
        Country.kp_ => 'Korea (Democratic People\'s Republic of)',
        Country.kr_ => 'Korea (Republic of)',
        Country.xk_ => 'Kosovo',
        Country.hr_ => 'Croatia',
        Country.cu_ => 'Cuba',
        Country.kw_ => 'Kuwait',
        Country.la_ => 'Lao People\'s Democratic Republic',
        Country.ls_ => 'Lesotho',
        Country.lv_ => 'Latvia',
        Country.lb_ => 'Lebanon',
        Country.lr_ => 'Liberia',
        Country.ly_ => 'Libya',
        Country.li_ => 'Liechtenstein',
        Country.lt_ => 'Lithuania',
        Country.lu_ => 'Luxembourg',
        Country.mg_ => 'Madagascar',
        Country.mw_ => 'Malawi',
        Country.my_ => 'Malaysia',
        Country.mv_ => 'Maldives',
        Country.ml_ => 'Mali',
        Country.mt_ => 'Malta',
        Country.ma_ => 'Morocco',
        Country.mh_ => 'Marshall Islands',
        Country.mr_ => 'Mauritania',
        Country.mu_ => 'Mauritius',
        Country.mx_ => 'Mexico',
        Country.fm_ => 'Micronesia (Federated States of)',
        Country.md_ => 'Moldova (Republic of)',
        Country.mc_ => 'Monaco',
        Country.mn_ => 'Mongolia',
        Country.me_ => 'Montenegro',
        Country.mz_ => 'Mozambique',
        Country.mm_ => 'Myanmar',
        Country.na_ => 'Namibia',
        Country.nr_ => 'Nauru',
        Country.np_ => 'Nepal',
        Country.nz_ => 'New Zealand',
        Country.ni_ => 'Nicaragua',
        Country.nl_ => 'Netherlands',
        Country.ne_ => 'Niger',
        Country.ng_ => 'Nigeria',
        Country.nu_ => 'Niue',
        Country.mk_ => 'North Macedonia',
        Country.no_ => 'Norway',
        Country.om_ => 'Oman',
        Country.at_ => 'Austria',
        Country.pk_ => 'Pakistan',
        Country.pw_ => 'Palau',
        Country.pa_ => 'Panama',
        Country.pg_ => 'Papua New Guinea',
        Country.py_ => 'Paraguay',
        Country.pe_ => 'Peru',
        Country.ph_ => 'Philippines',
        Country.pl_ => 'Poland',
        Country.pt_ => 'Portugal',
        Country.rw_ => 'Rwanda',
        Country.ro_ => 'Romania',
        Country.ru_ => 'Russian Federation',
        Country.sb_ => 'Solomon Islands',
        Country.zm_ => 'Zambia',
        Country.ws_ => 'Samoa',
        Country.sm_ => 'San Marino',
        Country.st_ => 'Sao Tome and Principe',
        Country.sa_ => 'Saudi Arabia',
        Country.se_ => 'Sweden',
        Country.ch_ => 'Switzerland',
        Country.sn_ => 'Senegal',
        Country.rs_ => 'Serbia',
        Country.sc_ => 'Seychelles',
        Country.sl_ => 'Sierra Leone',
        Country.zw_ => 'Zimbabwe',
        Country.sg_ => 'Singapore',
        Country.sk_ => 'Slovakia',
        Country.si_ => 'Slovenia',
        Country.so_ => 'Somalia',
        Country.es_ => 'Spain',
        Country.lk_ => 'Sri Lanka',
        Country.kn_ => 'Saint Kitts and Nevis',
        Country.lc_ => 'Saint Lucia',
        Country.vc_ => 'Saint Vincent and the Grenadines',
        Country.za_ => 'South Africa',
        Country.sd_ => 'Sudan',
        Country.ss_ => 'South Sudan',
        Country.sr_ => 'Suriname',
        Country.sy_ => 'Syrian Arab Republic',
        Country.tj_ => 'Tajikistan',
        Country.tz_ => 'Tanzania, United Republic of',
        Country.th_ => 'Thailand',
        Country.tl_ => 'Timor-Leste',
        Country.tg_ => 'Togo',
        Country.to_ => 'Tonga',
        Country.tt_ => 'Trinidad and Tobago',
        Country.td_ => 'Chad',
        Country.cz_ => 'Czechia',
        Country.tn_ => 'Tunisia',
        Country.tr_ => 'Turkey',
        Country.tm_ => 'Turkmenistan',
        Country.tv_ => 'Tuvalu',
        Country.ug_ => 'Uganda',
        Country.ua_ => 'Ukraine',
        Country.hu_ => 'Hungary',
        Country.uy_ => 'Uruguay',
        Country.uz_ => 'Uzbekistan',
        Country.vu_ => 'Vanuatu',
        Country.ve_ => 'Venezuela (Bolivarian Republic of)',
        Country.ae_ => 'United Arab Emirates',
        Country.us_ => 'United States of America',
        Country.gb_ => 'United Kingdom of Great Britain and Northern Ireland',
        Country.vn_ => 'Viet Nam',
        Country.cf_ => 'Central African Republic',
        Country.cy_ => 'Cyprus',
      };
}
