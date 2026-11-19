import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('tr')];

  /// No description provided for @appName.
  ///
  /// In tr, this message translates to:
  /// **'Garaj'**
  String get appName;

  /// No description provided for @overview.
  ///
  /// In tr, this message translates to:
  /// **'Özet'**
  String get overview;

  /// No description provided for @history.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş'**
  String get history;

  /// No description provided for @expenses.
  ///
  /// In tr, this message translates to:
  /// **'Masraflar'**
  String get expenses;

  /// No description provided for @myVehicle.
  ///
  /// In tr, this message translates to:
  /// **'Aracım'**
  String get myVehicle;

  /// No description provided for @save.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In tr, this message translates to:
  /// **'Vazgeç'**
  String get cancel;

  /// No description provided for @addVehicle.
  ///
  /// In tr, this message translates to:
  /// **'Araç ekle'**
  String get addVehicle;

  /// No description provided for @scanReceipt.
  ///
  /// In tr, this message translates to:
  /// **'Fiş tara'**
  String get scanReceipt;

  /// No description provided for @receiptPrivacy.
  ///
  /// In tr, this message translates to:
  /// **'Garaj fiş fotoğrafını sunucusuna yüklemez.'**
  String get receiptPrivacy;

  /// No description provided for @offline.
  ///
  /// In tr, this message translates to:
  /// **'Çevrimdışı'**
  String get offline;

  /// No description provided for @maintenanceInfoRequired.
  ///
  /// In tr, this message translates to:
  /// **'Bakım bilgisi gerekli'**
  String get maintenanceInfoRequired;

  /// No description provided for @uiYerelOnizlemeBulutHesabinaBagliDegil.
  ///
  /// In tr, this message translates to:
  /// **'Yerel önizleme · bulut hesabına bağlı değil'**
  String get uiYerelOnizlemeBulutHesabinaBagliDegil;

  /// No description provided for @uiEsitleniyor.
  ///
  /// In tr, this message translates to:
  /// **'Eşitleniyor…'**
  String get uiEsitleniyor;

  /// No description provided for @uiKayitGonderilmeyiBekliyor.
  ///
  /// In tr, this message translates to:
  /// **'{p0} kayıt gönderilmeyi bekliyor'**
  String uiKayitGonderilmeyiBekliyor(String p0);

  /// No description provided for @uiCevrimdisiSonEsitleme.
  ///
  /// In tr, this message translates to:
  /// **'Çevrimdışı · son eşitleme {p0}'**
  String uiCevrimdisiSonEsitleme(String p0);

  /// No description provided for @uiYeniKayitEkle.
  ///
  /// In tr, this message translates to:
  /// **'Yeni kayıt ekle'**
  String get uiYeniKayitEkle;

  /// No description provided for @uiKm.
  ///
  /// In tr, this message translates to:
  /// **'{p0} km'**
  String uiKm(String p0);

  /// No description provided for @uiBilgiYok.
  ///
  /// In tr, this message translates to:
  /// **'Bilgi yok'**
  String get uiBilgiYok;

  /// No description provided for @uiText.
  ///
  /// In tr, this message translates to:
  /// **'{p0} {p1} {p2}'**
  String uiText(String p0, String p1, String p2);

  /// No description provided for @uiToplamHarcama.
  ///
  /// In tr, this message translates to:
  /// **'Toplam harcama {p0}. {p1}'**
  String uiToplamHarcama(String p0, String p1);

  /// No description provided for @uiToplamHarcama2.
  ///
  /// In tr, this message translates to:
  /// **'TOPLAM HARCAMA'**
  String get uiToplamHarcama2;

  /// No description provided for @uiAracSilueti.
  ///
  /// In tr, this message translates to:
  /// **'Araç silueti'**
  String get uiAracSilueti;

  /// No description provided for @uiSil.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get uiSil;

  /// No description provided for @uiYeniKayit.
  ///
  /// In tr, this message translates to:
  /// **'Yeni kayıt'**
  String get uiYeniKayit;

  /// No description provided for @uiAracinlaIlgiliHerSeyBirYerde.
  ///
  /// In tr, this message translates to:
  /// **'Aracınla ilgili her şey bir yerde.'**
  String get uiAracinlaIlgiliHerSeyBirYerde;

  /// No description provided for @uiFotograftanYakitBilgileriniOku.
  ///
  /// In tr, this message translates to:
  /// **'Fotoğraftan yakıt bilgilerini oku'**
  String get uiFotograftanYakitBilgileriniOku;

  /// No description provided for @uiYakitEkle.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt ekle'**
  String get uiYakitEkle;

  /// No description provided for @uiElleYakitKaydiOlustur.
  ///
  /// In tr, this message translates to:
  /// **'Elle yakıt kaydı oluştur'**
  String get uiElleYakitKaydiOlustur;

  /// No description provided for @uiMasrafEkle.
  ///
  /// In tr, this message translates to:
  /// **'Masraf ekle'**
  String get uiMasrafEkle;

  /// No description provided for @uiSigortaVergiVeDigerGiderler.
  ///
  /// In tr, this message translates to:
  /// **'Sigorta, vergi ve diğer giderler'**
  String get uiSigortaVergiVeDigerGiderler;

  /// No description provided for @uiBakimEkle.
  ///
  /// In tr, this message translates to:
  /// **'Bakım ekle'**
  String get uiBakimEkle;

  /// No description provided for @uiYapilanIslemleriVeParcalariKaydet.
  ///
  /// In tr, this message translates to:
  /// **'Yapılan işlemleri ve parçaları kaydet'**
  String get uiYapilanIslemleriVeParcalariKaydet;

  /// No description provided for @uiKmGuncelle.
  ///
  /// In tr, this message translates to:
  /// **'Km güncelle'**
  String get uiKmGuncelle;

  /// No description provided for @uiGuncelGostergeBilgisiniGir.
  ///
  /// In tr, this message translates to:
  /// **'Güncel gösterge bilgisini gir'**
  String get uiGuncelGostergeBilgisiniGir;

  /// No description provided for @uiYakitTuru.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt türü'**
  String get uiYakitTuru;

  /// No description provided for @uiBirimFiyat.
  ///
  /// In tr, this message translates to:
  /// **'Birim fiyat'**
  String get uiBirimFiyat;

  /// No description provided for @uiIstasyon.
  ///
  /// In tr, this message translates to:
  /// **'İstasyon'**
  String get uiIstasyon;

  /// No description provided for @uiYakitFisiniTara.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt fişini tara'**
  String get uiYakitFisiniTara;

  /// No description provided for @uiBirFotografTumDetaylar.
  ///
  /// In tr, this message translates to:
  /// **'BİR FOTOĞRAF. TÜM DETAYLAR.'**
  String get uiBirFotografTumDetaylar;

  /// No description provided for @uiFisiniKaydaDonustur.
  ///
  /// In tr, this message translates to:
  /// **'Fişini kayda dönüştür.'**
  String get uiFisiniKaydaDonustur;

  /// No description provided for @uiFisiDuzBirZemineKoyTarih.
  ///
  /// In tr, this message translates to:
  /// **'Fişi düz bir zemine koy. Tarih, litre ve tutarın kadrajda olduğundan emin ol.'**
  String get uiFisiDuzBirZemineKoyTarih;

  /// No description provided for @uiFisTelefondaOkunuyor.
  ///
  /// In tr, this message translates to:
  /// **'Fiş telefonda okunuyor…'**
  String get uiFisTelefondaOkunuyor;

  /// No description provided for @uiYakitFisiniCerceveyeAl.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt fişini çerçeveye al'**
  String get uiYakitFisiniCerceveyeAl;

  /// No description provided for @uiKameraKirpKontrolEtKaydet.
  ///
  /// In tr, this message translates to:
  /// **'Kamera → kırp → kontrol et → kaydet'**
  String get uiKameraKirpKontrolEtKaydet;

  /// No description provided for @uiFotografCek.
  ///
  /// In tr, this message translates to:
  /// **'Fotoğraf çek'**
  String get uiFotografCek;

  /// No description provided for @uiGaleridenSec.
  ///
  /// In tr, this message translates to:
  /// **'Galeriden seç'**
  String get uiGaleridenSec;

  /// No description provided for @uiFissizElleYakitEkle.
  ///
  /// In tr, this message translates to:
  /// **'Fişsiz, elle yakıt ekle'**
  String get uiFissizElleYakitEkle;

  /// No description provided for @uiGarajFisFotografiniSunucusunaYuklemezOkuma.
  ///
  /// In tr, this message translates to:
  /// **'Garaj fiş fotoğrafını sunucusuna yüklemez. Okuma tamamen telefonda yapılır.'**
  String get uiGarajFisFotografiniSunucusunaYuklemezOkuma;

  /// No description provided for @uiText2.
  ///
  /// In tr, this message translates to:
  /// **'{p0} {p1}'**
  String uiText2(String p0, String p1);

  /// No description provided for @uiText3.
  ///
  /// In tr, this message translates to:
  /// **'{p0} · {p1}'**
  String uiText3(String p0, String p1);

  /// No description provided for @uiGarajinSeniBekliyor.
  ///
  /// In tr, this message translates to:
  /// **'Garajın seni bekliyor.'**
  String get uiGarajinSeniBekliyor;

  /// No description provided for @uiIlkAraciniEkleYakitiniBakiminiVe.
  ///
  /// In tr, this message translates to:
  /// **'İlk aracını ekle; yakıtını, bakımını ve masraflarını tek yerden takip et.'**
  String get uiIlkAraciniEkleYakitiniBakiminiVe;

  /// No description provided for @uiIlkAracimiEkle.
  ///
  /// In tr, this message translates to:
  /// **'İlk aracımı ekle'**
  String get uiIlkAracimiEkle;

  /// No description provided for @uiGarajinaHosGeldin.
  ///
  /// In tr, this message translates to:
  /// **'Garajına hoş geldin.'**
  String get uiGarajinaHosGeldin;

  /// No description provided for @uiGaraj.
  ///
  /// In tr, this message translates to:
  /// **'GARAJ'**
  String get uiGaraj;

  /// No description provided for @uiHerSeyYolundaMi.
  ///
  /// In tr, this message translates to:
  /// **'Her şey yolunda mı?'**
  String get uiHerSeyYolundaMi;

  /// No description provided for @uiYolaHazirOl.
  ///
  /// In tr, this message translates to:
  /// **'YOLA HAZIR OL'**
  String get uiYolaHazirOl;

  /// No description provided for @uiTumUyarilar.
  ///
  /// In tr, this message translates to:
  /// **'Tüm uyarılar'**
  String get uiTumUyarilar;

  /// No description provided for @uiText4.
  ///
  /// In tr, this message translates to:
  /// **'{p0}'**
  String uiText4(String p0);

  /// No description provided for @uiBilgiGerekli.
  ///
  /// In tr, this message translates to:
  /// **'Bilgi gerekli'**
  String get uiBilgiGerekli;

  /// No description provided for @uiGun.
  ///
  /// In tr, this message translates to:
  /// **'{p0} gün'**
  String uiGun(String p0);

  /// No description provided for @uiBakimPlani.
  ///
  /// In tr, this message translates to:
  /// **'BAKIM PLANI'**
  String get uiBakimPlani;

  /// No description provided for @uiBakimZamaniGecti.
  ///
  /// In tr, this message translates to:
  /// **'BAKIM ZAMANI GEÇTİ'**
  String get uiBakimZamaniGecti;

  /// No description provided for @uiSonrakiBakima.
  ///
  /// In tr, this message translates to:
  /// **'SONRAKİ BAKIMA'**
  String get uiSonrakiBakima;

  /// No description provided for @uiSonBakiminiEkleyerekTakibeBasla.
  ///
  /// In tr, this message translates to:
  /// **'Son bakımını ekleyerek takibe başla.'**
  String get uiSonBakiminiEkleyerekTakibeBasla;

  /// No description provided for @uiSonBakimiEkle.
  ///
  /// In tr, this message translates to:
  /// **'Son bakımı ekle'**
  String get uiSonBakimiEkle;

  /// No description provided for @uiBakimDurumu.
  ///
  /// In tr, this message translates to:
  /// **'Bakım durumu: {p0}'**
  String uiBakimDurumu(String p0);

  /// No description provided for @uiGuncelKm.
  ///
  /// In tr, this message translates to:
  /// **'GÜNCEL KM'**
  String get uiGuncelKm;

  /// No description provided for @uiBeyan.
  ///
  /// In tr, this message translates to:
  /// **'{p0} · beyan'**
  String uiBeyan(String p0);

  /// No description provided for @uiSonBakim.
  ///
  /// In tr, this message translates to:
  /// **'SON BAKIM'**
  String get uiSonBakim;

  /// No description provided for @uiKilometreBilinmiyor.
  ///
  /// In tr, this message translates to:
  /// **'Kilometre bilinmiyor'**
  String get uiKilometreBilinmiyor;

  /// No description provided for @uiSonrakiBakim.
  ///
  /// In tr, this message translates to:
  /// **'SONRAKİ BAKIM'**
  String get uiSonrakiBakim;

  /// No description provided for @uiTakvimTakibi.
  ///
  /// In tr, this message translates to:
  /// **'Takvim takibi'**
  String get uiTakvimTakibi;

  /// No description provided for @uiUyarilarVeEksikler.
  ///
  /// In tr, this message translates to:
  /// **'Uyarılar ve eksikler'**
  String get uiUyarilarVeEksikler;

  /// No description provided for @uiTumu.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get uiTumu;

  /// No description provided for @uiSuAnAcikBirUyarinYok.
  ///
  /// In tr, this message translates to:
  /// **'Şu an açık bir uyarın yok.'**
  String get uiSuAnAcikBirUyarinYok;

  /// No description provided for @uiSonYakitDuraklarin.
  ///
  /// In tr, this message translates to:
  /// **'Son yakıt durakların'**
  String get uiSonYakitDuraklarin;

  /// No description provided for @uiHaritayiAc.
  ///
  /// In tr, this message translates to:
  /// **'Haritayı aç'**
  String get uiHaritayiAc;

  /// No description provided for @uiIlkDuraginiKaydet.
  ///
  /// In tr, this message translates to:
  /// **'İlk durağını kaydet.'**
  String get uiIlkDuraginiKaydet;

  /// No description provided for @uiYakitAldiginSon5FarkliIstasyon.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt aldığın son 5 farklı istasyon burada görünecek.'**
  String get uiYakitAldiginSon5FarkliIstasyon;

  /// No description provided for @uiFislerinBuTelefondaKayitlarinGuvende.
  ///
  /// In tr, this message translates to:
  /// **'Fişlerin bu telefonda. Kayıtların güvende.'**
  String get uiFislerinBuTelefondaKayitlarinGuvende;

  /// No description provided for @uiNormal.
  ///
  /// In tr, this message translates to:
  /// **'Normal'**
  String get uiNormal;

  /// No description provided for @uiYaklasiyor.
  ///
  /// In tr, this message translates to:
  /// **'Yaklaşıyor'**
  String get uiYaklasiyor;

  /// No description provided for @uiGecikti.
  ///
  /// In tr, this message translates to:
  /// **'Gecikti'**
  String get uiGecikti;

  /// No description provided for @uiHerBakiminBirKaydi.
  ///
  /// In tr, this message translates to:
  /// **'Her bakımın bir kaydı.'**
  String get uiHerBakiminBirKaydi;

  /// No description provided for @uiBakimGecmisi.
  ///
  /// In tr, this message translates to:
  /// **'BAKIM GEÇMİŞİ'**
  String get uiBakimGecmisi;

  /// No description provided for @uiBakimGecmisinBuradaBasliyor.
  ///
  /// In tr, this message translates to:
  /// **'Bakım geçmişin burada başlıyor.'**
  String get uiBakimGecmisinBuradaBasliyor;

  /// No description provided for @uiYapilanIslemleriDegisenParcalariVeKilometreyi.
  ///
  /// In tr, this message translates to:
  /// **'Yapılan işlemleri, değişen parçaları ve kilometreyi kaydet.'**
  String get uiYapilanIslemleriDegisenParcalariVeKilometreyi;

  /// No description provided for @uiDuzenlemekIcinBirBakimKaydinaDokun.
  ///
  /// In tr, this message translates to:
  /// **'Düzenlemek için bir bakım kaydına dokun.'**
  String get uiDuzenlemekIcinBirBakimKaydinaDokun;

  /// No description provided for @uiYolunSanaMaliyeti.
  ///
  /// In tr, this message translates to:
  /// **'Yolun sana maliyeti.'**
  String get uiYolunSanaMaliyeti;

  /// No description provided for @uiMasraflar.
  ///
  /// In tr, this message translates to:
  /// **'MASRAFLAR'**
  String get uiMasraflar;

  /// No description provided for @uiHafta.
  ///
  /// In tr, this message translates to:
  /// **'Hafta'**
  String get uiHafta;

  /// No description provided for @uiAy.
  ///
  /// In tr, this message translates to:
  /// **'Ay'**
  String get uiAy;

  /// No description provided for @uiYil.
  ///
  /// In tr, this message translates to:
  /// **'Yıl'**
  String get uiYil;

  /// No description provided for @uiOncekiDonem.
  ///
  /// In tr, this message translates to:
  /// **'Önceki dönem'**
  String get uiOncekiDonem;

  /// No description provided for @uiSonrakiDonem.
  ///
  /// In tr, this message translates to:
  /// **'Sonraki dönem'**
  String get uiSonrakiDonem;

  /// No description provided for @uiBuDonemdeHenuzBirHarcamaYok.
  ///
  /// In tr, this message translates to:
  /// **'Bu dönemde henüz bir harcama yok.'**
  String get uiBuDonemdeHenuzBirHarcamaYok;

  /// No description provided for @uiText5.
  ///
  /// In tr, this message translates to:
  /// **'%{p0}'**
  String uiText5(String p0);

  /// No description provided for @uiSon6DonemeBakis.
  ///
  /// In tr, this message translates to:
  /// **'Son 6 döneme bakış'**
  String get uiSon6DonemeBakis;

  /// No description provided for @uiDetayliRaporuAc.
  ///
  /// In tr, this message translates to:
  /// **'Detaylı raporu aç'**
  String get uiDetayliRaporuAc;

  /// No description provided for @uiSonKayitlar.
  ///
  /// In tr, this message translates to:
  /// **'Son kayıtlar'**
  String get uiSonKayitlar;

  /// No description provided for @uiIlkMasrafiniEkle.
  ///
  /// In tr, this message translates to:
  /// **'İlk masrafını ekle.'**
  String get uiIlkMasrafiniEkle;

  /// No description provided for @uiYakitVeBakimKayitlarinDaOtomatik.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt ve bakım kayıtların da otomatik olarak buraya yansır.'**
  String get uiYakitVeBakimKayitlarinDaOtomatik;

  /// No description provided for @uiText6.
  ///
  /// In tr, this message translates to:
  /// **'{p0} – {p1}'**
  String uiText6(String p0, String p1);

  /// No description provided for @uiSonAltiDoneminHarcamalari.
  ///
  /// In tr, this message translates to:
  /// **'Son altı dönemin harcamaları: {p0}'**
  String uiSonAltiDoneminHarcamalari(String p0);

  /// No description provided for @uiDetayliRapor.
  ///
  /// In tr, this message translates to:
  /// **'Detaylı rapor'**
  String get uiDetayliRapor;

  /// No description provided for @uiKayitlardaAra.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlarda ara'**
  String get uiKayitlardaAra;

  /// No description provided for @uiYakitOzeti.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt özeti'**
  String get uiYakitOzeti;

  /// No description provided for @uiL.
  ///
  /// In tr, this message translates to:
  /// **'{p0} L'**
  String uiL(String p0);

  /// No description provided for @uiL2.
  ///
  /// In tr, this message translates to:
  /// **'{p0} / L'**
  String uiL2(String p0);

  /// No description provided for @uiIslemListesi.
  ///
  /// In tr, this message translates to:
  /// **'İşlem listesi'**
  String get uiIslemListesi;

  /// No description provided for @uiKayitBulunamadi.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt bulunamadı.'**
  String get uiKayitBulunamadi;

  /// No description provided for @uiDonemVeyaFiltreyiDegistirerekTekrarBakabilirsin.
  ///
  /// In tr, this message translates to:
  /// **'Dönem veya filtreyi değiştirerek tekrar bakabilirsin.'**
  String get uiDonemVeyaFiltreyiDegistirerekTekrarBakabilirsin;

  /// No description provided for @uiSanaAitBirGaraj.
  ///
  /// In tr, this message translates to:
  /// **'Sana ait bir garaj.'**
  String get uiSanaAitBirGaraj;

  /// No description provided for @uiAracim.
  ///
  /// In tr, this message translates to:
  /// **'ARACIM'**
  String get uiAracim;

  /// No description provided for @uiAyarlar.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get uiAyarlar;

  /// No description provided for @uiAracFotografiEkle.
  ///
  /// In tr, this message translates to:
  /// **'Araç fotoğrafı ekle'**
  String get uiAracFotografiEkle;

  /// No description provided for @uiAracFotografi.
  ///
  /// In tr, this message translates to:
  /// **'{p0} {p1} araç fotoğrafı'**
  String uiAracFotografi(String p0, String p1);

  /// No description provided for @uiAracBilgileriniDuzenle.
  ///
  /// In tr, this message translates to:
  /// **'Araç bilgilerini düzenle'**
  String get uiAracBilgileriniDuzenle;

  /// No description provided for @uiAracininDurumu.
  ///
  /// In tr, this message translates to:
  /// **'Aracının durumu'**
  String get uiAracininDurumu;

  /// No description provided for @uiBakimDurumu2.
  ///
  /// In tr, this message translates to:
  /// **'Bakım durumu'**
  String get uiBakimDurumu2;

  /// No description provided for @uiMotorDurumu.
  ///
  /// In tr, this message translates to:
  /// **'Motor durumu'**
  String get uiMotorDurumu;

  /// No description provided for @uiMotorDurumunuGuncelle.
  ///
  /// In tr, this message translates to:
  /// **'Motor durumunu güncelle'**
  String get uiMotorDurumunuGuncelle;

  /// No description provided for @uiKontrolGerekli.
  ///
  /// In tr, this message translates to:
  /// **'Kontrol gerekli'**
  String get uiKontrolGerekli;

  /// No description provided for @uiKullaniciBeyani.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı beyanı · {p0}'**
  String uiKullaniciBeyani(String p0);

  /// No description provided for @uiYakitSeviyesi.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt seviyesi'**
  String get uiYakitSeviyesi;

  /// No description provided for @uiYakitSeviyesiniGuncelle.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt seviyesini güncelle'**
  String get uiYakitSeviyesiniGuncelle;

  /// No description provided for @uiGostergePanelindekiAnaYakitBeyan.
  ///
  /// In tr, this message translates to:
  /// **'Gösterge panelindeki ana yakıt · beyan {p0}'**
  String uiGostergePanelindekiAnaYakitBeyan(String p0);

  /// No description provided for @uiBelgelerVeHatirlatmalar.
  ///
  /// In tr, this message translates to:
  /// **'Belgeler ve hatırlatmalar'**
  String get uiBelgelerVeHatirlatmalar;

  /// No description provided for @uiTrafikSigortasi.
  ///
  /// In tr, this message translates to:
  /// **'Trafik sigortası'**
  String get uiTrafikSigortasi;

  /// No description provided for @uiServisHatirlaticilari.
  ///
  /// In tr, this message translates to:
  /// **'Servis hatırlatıcıları'**
  String get uiServisHatirlaticilari;

  /// No description provided for @uiKmGunOnce.
  ///
  /// In tr, this message translates to:
  /// **'{p0} km / {p1} gün önce'**
  String uiKmGunOnce(String p0, String p1);

  /// No description provided for @uiKilometreKayitlariVeDuzeltme.
  ///
  /// In tr, this message translates to:
  /// **'Kilometre kayıtları ve düzeltme'**
  String get uiKilometreKayitlariVeDuzeltme;

  /// No description provided for @uiEkspertizRaporlari.
  ///
  /// In tr, this message translates to:
  /// **'Ekspertiz raporları'**
  String get uiEkspertizRaporlari;

  /// No description provided for @uiYukle.
  ///
  /// In tr, this message translates to:
  /// **'Yükle'**
  String get uiYukle;

  /// No description provided for @uiRaporunuGuvenleSakla.
  ///
  /// In tr, this message translates to:
  /// **'Raporunu güvenle sakla.'**
  String get uiRaporunuGuvenleSakla;

  /// No description provided for @uiGuncelEkspertizRaporunuPdfVeyaFotograf.
  ///
  /// In tr, this message translates to:
  /// **'Güncel ekspertiz raporunu PDF veya fotoğraf olarak ekle.'**
  String get uiGuncelEkspertizRaporunuPdfVeyaFotograf;

  /// No description provided for @uiRaporYukle.
  ///
  /// In tr, this message translates to:
  /// **'Rapor yükle'**
  String get uiRaporYukle;

  /// No description provided for @uiEkspertizRaporu.
  ///
  /// In tr, this message translates to:
  /// **'Ekspertiz raporu'**
  String get uiEkspertizRaporu;

  /// No description provided for @uiText7.
  ///
  /// In tr, this message translates to:
  /// **'{p0}{p1}'**
  String uiText7(String p0, String p1);

  /// No description provided for @uiRaporuSil.
  ///
  /// In tr, this message translates to:
  /// **'Raporu sil'**
  String get uiRaporuSil;

  /// No description provided for @uiRaporSilinsinMi.
  ///
  /// In tr, this message translates to:
  /// **'Rapor silinsin mi?'**
  String get uiRaporSilinsinMi;

  /// No description provided for @uiBaskaBirAracEkle.
  ///
  /// In tr, this message translates to:
  /// **'Başka bir araç ekle'**
  String get uiBaskaBirAracEkle;

  /// No description provided for @uiGunGecti.
  ///
  /// In tr, this message translates to:
  /// **'{p0} gün geçti'**
  String uiGunGecti(String p0);

  /// No description provided for @uiBuBilgiSeninBeyanindirUygulamaMotor.
  ///
  /// In tr, this message translates to:
  /// **'Bu bilgi senin beyanındır. Uygulama motor teşhisi yapmaz.'**
  String get uiBuBilgiSeninBeyanindirUygulamaMotor;

  /// No description provided for @uiNot.
  ///
  /// In tr, this message translates to:
  /// **'Not'**
  String get uiNot;

  /// No description provided for @uiGostergePanelindekiAnaYakitSeviyesiniGir.
  ///
  /// In tr, this message translates to:
  /// **'Gösterge panelindeki ana yakıt seviyesini gir.'**
  String get uiGostergePanelindekiAnaYakitSeviyesiniGir;

  /// No description provided for @uiUyarilarVeIhtiyaclar.
  ///
  /// In tr, this message translates to:
  /// **'Uyarılar ve ihtiyaçlar'**
  String get uiUyarilarVeIhtiyaclar;

  /// No description provided for @uiSorunEkle.
  ///
  /// In tr, this message translates to:
  /// **'Sorun ekle'**
  String get uiSorunEkle;

  /// No description provided for @uiHerSeyTamam.
  ///
  /// In tr, this message translates to:
  /// **'Her şey tamam.'**
  String get uiHerSeyTamam;

  /// No description provided for @uiAcikBirUyarinYok.
  ///
  /// In tr, this message translates to:
  /// **'Açık bir uyarın yok.'**
  String get uiAcikBirUyarinYok;

  /// No description provided for @uiIhtiyacSorunEkle.
  ///
  /// In tr, this message translates to:
  /// **'İhtiyaç / sorun ekle'**
  String get uiIhtiyacSorunEkle;

  /// No description provided for @uiSorunuGiderdiysenCozulduOlarakIsaretleyebilirsin.
  ///
  /// In tr, this message translates to:
  /// **'Sorunu giderdiysen çözüldü olarak işaretleyebilirsin.'**
  String get uiSorunuGiderdiysenCozulduOlarakIsaretleyebilirsin;

  /// No description provided for @uiKapat.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get uiKapat;

  /// No description provided for @uiCozuldu.
  ///
  /// In tr, this message translates to:
  /// **'Çözüldü'**
  String get uiCozuldu;

  /// No description provided for @uiL3.
  ///
  /// In tr, this message translates to:
  /// **'{p0} · {p1} / L'**
  String uiL3(String p0, String p1);

  /// No description provided for @uiIstasyonlarinaKonumEkle.
  ///
  /// In tr, this message translates to:
  /// **'İstasyonlarına konum ekle'**
  String get uiIstasyonlarinaKonumEkle;

  /// No description provided for @uiIstasyonunKonumuKayitli.
  ///
  /// In tr, this message translates to:
  /// **'{p0} istasyonun konumu kayıtlı'**
  String uiIstasyonunKonumuKayitli(String p0);

  /// No description provided for @uiYolTarifiIcinAsagidanBirIstasyon.
  ///
  /// In tr, this message translates to:
  /// **'Yol tarifi için aşağıdan bir istasyon seç.'**
  String get uiYolTarifiIcinAsagidanBirIstasyon;

  /// No description provided for @uiBuIstasyondaKonumYokYakitKaydini.
  ///
  /// In tr, this message translates to:
  /// **'Bu istasyonda konum yok. Yakıt kaydını düzenleyerek ekleyebilirsin.'**
  String get uiBuIstasyondaKonumYokYakitKaydini;

  /// No description provided for @uiHaritaUygulamasiAcilamadi.
  ///
  /// In tr, this message translates to:
  /// **'Harita uygulaması açılamadı.'**
  String get uiHaritaUygulamasiAcilamadi;

  /// No description provided for @uiKilometreKayitlari.
  ///
  /// In tr, this message translates to:
  /// **'Kilometre kayıtları'**
  String get uiKilometreKayitlari;

  /// No description provided for @uiYakitVeBakimOkumalariniKendiKaydinda.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt ve bakım okumalarını kendi kaydında düzenle. Yanlış bir manuel okumayı silip doğrusunu ekleyebilirsin.'**
  String get uiYakitVeBakimOkumalariniKendiKaydinda;

  /// No description provided for @uiYeniOkumaEkle.
  ///
  /// In tr, this message translates to:
  /// **'Yeni okuma ekle'**
  String get uiYeniOkumaEkle;

  /// No description provided for @uiManuelOkumayiSil.
  ///
  /// In tr, this message translates to:
  /// **'Manuel okumayı sil'**
  String get uiManuelOkumayiSil;

  /// No description provided for @uiAracinlaIlgiliHerSeyTekYerde.
  ///
  /// In tr, this message translates to:
  /// **'Aracınla ilgili her şey, tek yerde.'**
  String get uiAracinlaIlgiliHerSeyTekYerde;

  /// No description provided for @uiHesapVeEsitleme.
  ///
  /// In tr, this message translates to:
  /// **'Hesap ve eşitleme'**
  String get uiHesapVeEsitleme;

  /// No description provided for @uiSonEsitleme.
  ///
  /// In tr, this message translates to:
  /// **'Son eşitleme'**
  String get uiSonEsitleme;

  /// No description provided for @uiHenuzEsitlenmedi.
  ///
  /// In tr, this message translates to:
  /// **'Henüz eşitlenmedi'**
  String get uiHenuzEsitlenmedi;

  /// No description provided for @uiYenile.
  ///
  /// In tr, this message translates to:
  /// **'Yenile'**
  String get uiYenile;

  /// No description provided for @uiBekleyenKayitlar.
  ///
  /// In tr, this message translates to:
  /// **'Bekleyen kayıtlar ({p0})'**
  String uiBekleyenKayitlar(String p0);

  /// No description provided for @uiBaglantidaOtomatikTekrarDenenir.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıda otomatik tekrar denenir.'**
  String get uiBaglantidaOtomatikTekrarDenenir;

  /// No description provided for @uiSimdiTekrarDene.
  ///
  /// In tr, this message translates to:
  /// **'Şimdi tekrar dene'**
  String get uiSimdiTekrarDene;

  /// No description provided for @uiKayitKontrolGerektiriyor.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt kontrol gerektiriyor'**
  String get uiKayitKontrolGerektiriyor;

  /// No description provided for @uiGonderilmeyiBekliyor.
  ///
  /// In tr, this message translates to:
  /// **'Gönderilmeyi bekliyor'**
  String get uiGonderilmeyiBekliyor;

  /// No description provided for @uiBaglantiKuruldugundaOtomatikGonderilir.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulduğunda otomatik gönderilir.'**
  String get uiBaglantiKuruldugundaOtomatikGonderilir;

  /// No description provided for @uiTercihler.
  ///
  /// In tr, this message translates to:
  /// **'Tercihler'**
  String get uiTercihler;

  /// No description provided for @uiDil.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get uiDil;

  /// No description provided for @uiTurkce.
  ///
  /// In tr, this message translates to:
  /// **'Türkçe'**
  String get uiTurkce;

  /// No description provided for @uiGorunum.
  ///
  /// In tr, this message translates to:
  /// **'Görünüm'**
  String get uiGorunum;

  /// No description provided for @uiKoyu.
  ///
  /// In tr, this message translates to:
  /// **'Koyu'**
  String get uiKoyu;

  /// No description provided for @uiBildirimEsikleri.
  ///
  /// In tr, this message translates to:
  /// **'Bildirim eşikleri'**
  String get uiBildirimEsikleri;

  /// No description provided for @uiKmGun.
  ///
  /// In tr, this message translates to:
  /// **'{p0} km / {p1} gün'**
  String uiKmGun(String p0, String p1);

  /// No description provided for @uiYerelFisArsivi.
  ///
  /// In tr, this message translates to:
  /// **'Yerel fiş arşivi'**
  String get uiYerelFisArsivi;

  /// No description provided for @uiFislerinYalnizcaBuTelefonda.
  ///
  /// In tr, this message translates to:
  /// **'Fişlerin yalnızca bu telefonda.'**
  String get uiFislerinYalnizcaBuTelefonda;

  /// No description provided for @uiTelefonDegisirseVeyaUygulamaSilinirseFis.
  ///
  /// In tr, this message translates to:
  /// **'Telefon değişirse veya uygulama silinirse fiş fotoğrafları geri gelmez. Onaylanmış yakıt ve masraf kayıtların buluttan geri gelir.'**
  String get uiTelefonDegisirseVeyaUygulamaSilinirseFis;

  /// No description provided for @uiCikisYapilsinMi.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış yapılsın mı?'**
  String get uiCikisYapilsinMi;

  /// No description provided for @uiBuHesabaAitYerelKayitlaraYeniden.
  ///
  /// In tr, this message translates to:
  /// **'Bu hesaba ait yerel kayıtlara yeniden giriş yapana kadar erişilemez.'**
  String get uiBuHesabaAitYerelKayitlaraYeniden;

  /// No description provided for @uiCikisYap.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış yap'**
  String get uiCikisYap;

  /// No description provided for @uiHesabinVeVerilerinSilinsinMi.
  ///
  /// In tr, this message translates to:
  /// **'Hesabın ve verilerin silinsin mi?'**
  String get uiHesabinVeVerilerinSilinsinMi;

  /// No description provided for @uiBuluttakiAraclarinKayitlarinVeBelgelerinSilinmesi.
  ///
  /// In tr, this message translates to:
  /// **'Buluttaki araçların, kayıtların ve belgelerin silinmesi başlatılır. Bu telefondaki veriler temizlenir. Bu işlem internet gerektirir ve geri alınamaz.'**
  String get uiBuluttakiAraclarinKayitlarinVeBelgelerinSilinmesi;

  /// No description provided for @uiHesabimiSil.
  ///
  /// In tr, this message translates to:
  /// **'Hesabımı sil'**
  String get uiHesabimiSil;

  /// No description provided for @uiGaraj100.
  ///
  /// In tr, this message translates to:
  /// **'Garaj · 0.1.0'**
  String get uiGaraj100;

  /// No description provided for @uiBakimHatirlatmaEsikleri.
  ///
  /// In tr, this message translates to:
  /// **'Bakım hatırlatma eşikleri'**
  String get uiBakimHatirlatmaEsikleri;

  /// No description provided for @uiKacKmOnce.
  ///
  /// In tr, this message translates to:
  /// **'Kaç km önce?'**
  String get uiKacKmOnce;

  /// No description provided for @uiKm2.
  ///
  /// In tr, this message translates to:
  /// **'km'**
  String get uiKm2;

  /// No description provided for @uiKacGunOnce.
  ///
  /// In tr, this message translates to:
  /// **'Kaç gün önce?'**
  String get uiKacGunOnce;

  /// No description provided for @uiGun2.
  ///
  /// In tr, this message translates to:
  /// **'gün'**
  String get uiGun2;

  /// No description provided for @uiGecerliEsiklerGirin.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli eşikler girin.'**
  String get uiGecerliEsiklerGirin;

  /// No description provided for @uiEkspertizRaporuEkle.
  ///
  /// In tr, this message translates to:
  /// **'Ekspertiz raporu ekle'**
  String get uiEkspertizRaporuEkle;

  /// No description provided for @uiPdfJpegVeyaPngEnFazla.
  ///
  /// In tr, this message translates to:
  /// **'PDF, JPEG veya PNG · en fazla 20 MB'**
  String get uiPdfJpegVeyaPngEnFazla;

  /// No description provided for @uiEkspertizFirmasiIstegeBagli.
  ///
  /// In tr, this message translates to:
  /// **'Ekspertiz firması (isteğe bağlı)'**
  String get uiEkspertizFirmasiIstegeBagli;

  /// No description provided for @uiRaporKilometresiIstegeBagli.
  ///
  /// In tr, this message translates to:
  /// **'Rapor kilometresi (isteğe bağlı)'**
  String get uiRaporKilometresiIstegeBagli;

  /// No description provided for @uiDosyayiSec.
  ///
  /// In tr, this message translates to:
  /// **'Dosyayı seç'**
  String get uiDosyayiSec;

  /// No description provided for @uiArsivBilgisiYukleniyor.
  ///
  /// In tr, this message translates to:
  /// **'Arşiv bilgisi yükleniyor…'**
  String get uiArsivBilgisiYukleniyor;

  /// No description provided for @uiFisFotografi.
  ///
  /// In tr, this message translates to:
  /// **'{p0} fiş fotoğrafı'**
  String uiFisFotografi(String p0);

  /// No description provided for @uiKb.
  ///
  /// In tr, this message translates to:
  /// **'{p0} KB'**
  String uiKb(String p0);

  /// No description provided for @uiMb.
  ///
  /// In tr, this message translates to:
  /// **'{p0} MB'**
  String uiMb(String p0);

  /// No description provided for @uiYerelFisFotograflariniTemizle.
  ///
  /// In tr, this message translates to:
  /// **'Yerel fiş fotoğraflarını temizle'**
  String get uiYerelFisFotograflariniTemizle;

  /// No description provided for @uiFisFotograflariSilinsinMi.
  ///
  /// In tr, this message translates to:
  /// **'Fiş fotoğrafları silinsin mi?'**
  String get uiFisFotograflariSilinsinMi;

  /// No description provided for @uiBuTelefondakiFisGoruntuleriVeOkuma.
  ///
  /// In tr, this message translates to:
  /// **'Bu telefondaki fiş görüntüleri ve okuma dökümleri silinir. Yakıt ve masraf kayıtların korunur.'**
  String get uiBuTelefondakiFisGoruntuleriVeOkuma;

  /// No description provided for @uiBuKayitBaskaBirCihazdaDegismis.
  ///
  /// In tr, this message translates to:
  /// **'Bu kayıt başka bir cihazda değişmiş olabilir.'**
  String get uiBuKayitBaskaBirCihazdaDegismis;

  /// No description provided for @uiBekleyenKayit.
  ///
  /// In tr, this message translates to:
  /// **'Bekleyen kayıt'**
  String get uiBekleyenKayit;

  /// No description provided for @uiBuKayitHenuzBulutaGonderilmediBaglanti.
  ///
  /// In tr, this message translates to:
  /// **'Bu kayıt henüz buluta gönderilmedi. Bağlantı kurulduğunda aynı işlem kimliğiyle yeniden gönderilir.'**
  String get uiBuKayitHenuzBulutaGonderilmediBaglanti;

  /// No description provided for @uiBekleyenIslemiKaldir.
  ///
  /// In tr, this message translates to:
  /// **'Bekleyen işlemi kaldır'**
  String get uiBekleyenIslemiKaldir;

  /// No description provided for @uiSonHLiGetir.
  ///
  /// In tr, this message translates to:
  /// **'Son hâli getir'**
  String get uiSonHLiGetir;

  /// No description provided for @uiBenimkiniYineDeUygula.
  ///
  /// In tr, this message translates to:
  /// **'Benimkini yine de uygula'**
  String get uiBenimkiniYineDeUygula;

  /// No description provided for @uiTekrarDene.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar dene'**
  String get uiTekrarDene;

  /// No description provided for @uiBekleyenIslemKaldirilsinMi.
  ///
  /// In tr, this message translates to:
  /// **'Bekleyen işlem kaldırılsın mı?'**
  String get uiBekleyenIslemKaldirilsinMi;

  /// No description provided for @uiHenuzGonderilmemisBuDegisiklikSilinirBuluttaki.
  ///
  /// In tr, this message translates to:
  /// **'Henüz gönderilmemiş bu değişiklik silinir. Buluttaki kayıt değiştirilmez.'**
  String get uiHenuzGonderilmemisBuDegisiklikSilinirBuluttaki;

  /// No description provided for @uiBenzin.
  ///
  /// In tr, this message translates to:
  /// **'Benzin'**
  String get uiBenzin;

  /// No description provided for @uiDizel.
  ///
  /// In tr, this message translates to:
  /// **'Dizel'**
  String get uiDizel;

  /// No description provided for @uiLpg.
  ///
  /// In tr, this message translates to:
  /// **'LPG'**
  String get uiLpg;

  /// No description provided for @uiElektrik.
  ///
  /// In tr, this message translates to:
  /// **'Elektrik'**
  String get uiElektrik;

  /// No description provided for @uiYakit.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt'**
  String get uiYakit;

  /// No description provided for @uiBakim.
  ///
  /// In tr, this message translates to:
  /// **'Bakım'**
  String get uiBakim;

  /// No description provided for @uiSigortaKasko.
  ///
  /// In tr, this message translates to:
  /// **'Sigorta / Kasko'**
  String get uiSigortaKasko;

  /// No description provided for @uiVergiMuayene.
  ///
  /// In tr, this message translates to:
  /// **'Vergi / Muayene'**
  String get uiVergiMuayene;

  /// No description provided for @uiOtoparkOtoyol.
  ///
  /// In tr, this message translates to:
  /// **'Otopark / Otoyol'**
  String get uiOtoparkOtoyol;

  /// No description provided for @uiYikama.
  ///
  /// In tr, this message translates to:
  /// **'Yıkama'**
  String get uiYikama;

  /// No description provided for @uiCeza.
  ///
  /// In tr, this message translates to:
  /// **'Ceza'**
  String get uiCeza;

  /// No description provided for @uiDiger.
  ///
  /// In tr, this message translates to:
  /// **'Diğer'**
  String get uiDiger;

  /// No description provided for @uiPeriyodikBakim.
  ///
  /// In tr, this message translates to:
  /// **'Periyodik bakım'**
  String get uiPeriyodikBakim;

  /// No description provided for @uiYagVeFiltre.
  ///
  /// In tr, this message translates to:
  /// **'Yağ ve filtre'**
  String get uiYagVeFiltre;

  /// No description provided for @uiMuayene.
  ///
  /// In tr, this message translates to:
  /// **'Muayene'**
  String get uiMuayene;

  /// No description provided for @uiOnarim.
  ///
  /// In tr, this message translates to:
  /// **'Onarım'**
  String get uiOnarim;

  /// No description provided for @uiLastik.
  ///
  /// In tr, this message translates to:
  /// **'Lastik'**
  String get uiLastik;

  /// No description provided for @uiAku.
  ///
  /// In tr, this message translates to:
  /// **'Akü'**
  String get uiAku;

  /// No description provided for @uiFren.
  ///
  /// In tr, this message translates to:
  /// **'Fren'**
  String get uiFren;

  /// No description provided for @uiKaydiSil.
  ///
  /// In tr, this message translates to:
  /// **'Kaydı sil'**
  String get uiKaydiSil;

  /// No description provided for @uiBaglantiYoksaKayitGuvenleBekletilirVe.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı yoksa kayıt güvenle bekletilir ve bağlantı geldiğinde gönderilir.'**
  String get uiBaglantiYoksaKayitGuvenleBekletilirVe;

  /// No description provided for @uiBuAlaniDoldurun.
  ///
  /// In tr, this message translates to:
  /// **'Bu alanı doldurun'**
  String get uiBuAlaniDoldurun;

  /// No description provided for @uiGecerliBirSayiGirin.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir sayı girin'**
  String get uiGecerliBirSayiGirin;

  /// No description provided for @uiText8.
  ///
  /// In tr, this message translates to:
  /// **'{p0}: {p1}'**
  String uiText8(String p0, String p1);

  /// No description provided for @uiGarajinaAracEkle.
  ///
  /// In tr, this message translates to:
  /// **'Garajına araç ekle'**
  String get uiGarajinaAracEkle;

  /// No description provided for @uiAracBilgileri.
  ///
  /// In tr, this message translates to:
  /// **'Araç bilgileri'**
  String get uiAracBilgileri;

  /// No description provided for @uiHerYolculugunBirBaslangiciVar.
  ///
  /// In tr, this message translates to:
  /// **'HER YOLCULUĞUN BİR BAŞLANGICI VAR'**
  String get uiHerYolculugunBirBaslangiciVar;

  /// No description provided for @uiAraciniTaniyalim.
  ///
  /// In tr, this message translates to:
  /// **'Aracını tanıyalım.'**
  String get uiAraciniTaniyalim;

  /// No description provided for @uiBilgilerinDahaSonraHerZamanDuzenlenebilir.
  ///
  /// In tr, this message translates to:
  /// **'Bilgilerin daha sonra her zaman düzenlenebilir.'**
  String get uiBilgilerinDahaSonraHerZamanDuzenlenebilir;

  /// No description provided for @uiMarka.
  ///
  /// In tr, this message translates to:
  /// **'Marka'**
  String get uiMarka;

  /// No description provided for @uiModel.
  ///
  /// In tr, this message translates to:
  /// **'Model'**
  String get uiModel;

  /// No description provided for @uiModelYili.
  ///
  /// In tr, this message translates to:
  /// **'Model yılı'**
  String get uiModelYili;

  /// No description provided for @uiPlaka.
  ///
  /// In tr, this message translates to:
  /// **'Plaka'**
  String get uiPlaka;

  /// No description provided for @uiMotorBilgisi.
  ///
  /// In tr, this message translates to:
  /// **'Motor bilgisi'**
  String get uiMotorBilgisi;

  /// No description provided for @uiOrn16Tdi.
  ///
  /// In tr, this message translates to:
  /// **'Örn. 1.6 TDI'**
  String get uiOrn16Tdi;

  /// No description provided for @uiRenk.
  ///
  /// In tr, this message translates to:
  /// **'Renk'**
  String get uiRenk;

  /// No description provided for @uiGuncelKilometre.
  ///
  /// In tr, this message translates to:
  /// **'Güncel kilometre'**
  String get uiGuncelKilometre;

  /// No description provided for @uiBakimPlani2.
  ///
  /// In tr, this message translates to:
  /// **'Bakım planı'**
  String get uiBakimPlani2;

  /// No description provided for @uiBakimAraligi.
  ///
  /// In tr, this message translates to:
  /// **'Bakım aralığı'**
  String get uiBakimAraligi;

  /// No description provided for @uiZamanAraligi.
  ///
  /// In tr, this message translates to:
  /// **'Zaman aralığı'**
  String get uiZamanAraligi;

  /// No description provided for @uiSonBakimBilgileriniBiliyorum.
  ///
  /// In tr, this message translates to:
  /// **'Son bakım bilgilerini biliyorum'**
  String get uiSonBakimBilgileriniBiliyorum;

  /// No description provided for @uiBilmiyorsanBosBirakabilirsin.
  ///
  /// In tr, this message translates to:
  /// **'Bilmiyorsan boş bırakabilirsin.'**
  String get uiBilmiyorsanBosBirakabilirsin;

  /// No description provided for @uiSonBakim2.
  ///
  /// In tr, this message translates to:
  /// **'Son bakım'**
  String get uiSonBakim2;

  /// No description provided for @uiSonBakimKilometresi.
  ///
  /// In tr, this message translates to:
  /// **'Son bakım kilometresi'**
  String get uiSonBakimKilometresi;

  /// No description provided for @uiBelgeTarihleri.
  ///
  /// In tr, this message translates to:
  /// **'Belge tarihleri'**
  String get uiBelgeTarihleri;

  /// No description provided for @uiKasko.
  ///
  /// In tr, this message translates to:
  /// **'Kasko'**
  String get uiKasko;

  /// No description provided for @uiYakitKaydi.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt kaydı'**
  String get uiYakitKaydi;

  /// No description provided for @uiYakitKaydiniDuzenle.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt kaydını düzenle'**
  String get uiYakitKaydiniDuzenle;

  /// No description provided for @uiFistenOkunanAlanlariKontrolEdipOnaylayin.
  ///
  /// In tr, this message translates to:
  /// **'Fişten okunan alanları kontrol edip onaylayın.'**
  String get uiFistenOkunanAlanlariKontrolEdipOnaylayin;

  /// No description provided for @uiTutarVeLitreSifirdanBuyukOlmali.
  ///
  /// In tr, this message translates to:
  /// **'Tutar ve litre sıfırdan büyük olmalı.'**
  String get uiTutarVeLitreSifirdanBuyukOlmali;

  /// No description provided for @uiOnceBirAracEkleyin.
  ///
  /// In tr, this message translates to:
  /// **'Önce bir araç ekleyin.'**
  String get uiOnceBirAracEkleyin;

  /// No description provided for @uiOlasiTekrarKayit.
  ///
  /// In tr, this message translates to:
  /// **'Olası tekrar kayıt'**
  String get uiOlasiTekrarKayit;

  /// No description provided for @uiAyniGunBenzerTutarVeLitreyle.
  ///
  /// In tr, this message translates to:
  /// **'Aynı gün benzer tutar ve litreyle bir kayıt var. Yine de kaydedilsin mi?'**
  String get uiAyniGunBenzerTutarVeLitreyle;

  /// No description provided for @uiKontrolEt.
  ///
  /// In tr, this message translates to:
  /// **'Kontrol et'**
  String get uiKontrolEt;

  /// No description provided for @uiYineDeKaydet.
  ///
  /// In tr, this message translates to:
  /// **'Yine de kaydet'**
  String get uiYineDeKaydet;

  /// No description provided for @uiIstasyonIcinGecerliBirKonumNoktasi.
  ///
  /// In tr, this message translates to:
  /// **'İstasyon için geçerli bir konum noktası seçin.'**
  String get uiIstasyonIcinGecerliBirKonumNoktasi;

  /// No description provided for @uiFisOkunduKaydetmedenOnceTumAlanlari.
  ///
  /// In tr, this message translates to:
  /// **'Fiş okundu. Kaydetmeden önce tüm alanları kontrol et.'**
  String get uiFisOkunduKaydetmedenOnceTumAlanlari;

  /// No description provided for @uiText9.
  ///
  /// In tr, this message translates to:
  /// **'• {p0}'**
  String uiText9(String p0);

  /// No description provided for @uiFistekiPlakaSeciliAracKaydetmedenOnce.
  ///
  /// In tr, this message translates to:
  /// **'Fişteki plaka: {p0}. Seçili araç: {p1}. Kaydetmeden önce aracı kontrol et.'**
  String uiFistekiPlakaSeciliAracKaydetmedenOnce(String p0, String p1);

  /// No description provided for @uiYakitTarihi.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt tarihi'**
  String get uiYakitTarihi;

  /// No description provided for @uiYakitTutari.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt tutarı'**
  String get uiYakitTutari;

  /// No description provided for @uiMiktar.
  ///
  /// In tr, this message translates to:
  /// **'Miktar'**
  String get uiMiktar;

  /// No description provided for @uiLitreFiyati.
  ///
  /// In tr, this message translates to:
  /// **'Litre fiyatı'**
  String get uiLitreFiyati;

  /// No description provided for @uiL4.
  ///
  /// In tr, this message translates to:
  /// **'₺ / L'**
  String get uiL4;

  /// No description provided for @uiTutarLitreVeFiyatTutarli.
  ///
  /// In tr, this message translates to:
  /// **'Tutar, litre ve fiyat tutarlı'**
  String get uiTutarLitreVeFiyatTutarli;

  /// No description provided for @uiTutarLitreVeFiyatiKontrolEt.
  ///
  /// In tr, this message translates to:
  /// **'Tutar, litre ve fiyatı kontrol et'**
  String get uiTutarLitreVeFiyatiKontrolEt;

  /// No description provided for @uiIstasyonSube.
  ///
  /// In tr, this message translates to:
  /// **'İstasyon / şube'**
  String get uiIstasyonSube;

  /// No description provided for @uiSonYakitAlimi.
  ///
  /// In tr, this message translates to:
  /// **'Son yakıt alımı: {p0}'**
  String uiSonYakitAlimi(String p0);

  /// No description provided for @uiIstasyonOnerisiSecimSende.
  ///
  /// In tr, this message translates to:
  /// **'Öneriler yalnızca yardımcıdır; doğru şubeyi sen seç.'**
  String get uiIstasyonOnerisiSecimSende;

  /// No description provided for @uiFisOkumaDogrulugu.
  ///
  /// In tr, this message translates to:
  /// **'Fiş okuma doğruluğu (bu telefon)'**
  String get uiFisOkumaDogrulugu;

  /// No description provided for @uiHenuzOnaylanmisFisYok.
  ///
  /// In tr, this message translates to:
  /// **'Henüz taranıp onaylanmış fiş yok.'**
  String get uiHenuzOnaylanmisFisYok;

  /// No description provided for @uiLitre.
  ///
  /// In tr, this message translates to:
  /// **'Litre'**
  String get uiLitre;

  /// No description provided for @uiDogrulukSatiri.
  ///
  /// In tr, this message translates to:
  /// **'Doğru %{p0} · emin okunan %{p1} · sessiz hata {p2}'**
  String uiDogrulukSatiri(String p0, String p1, String p2);

  /// No description provided for @uiDogrulukOzeti.
  ///
  /// In tr, this message translates to:
  /// **'{p0} fiş · {p1} yüksek güvenli alan · sessiz hata üst sınırı %{p2}'**
  String uiDogrulukOzeti(String p0, String p1, String p2);

  /// No description provided for @uiDogrulukHedefKarsilaniyor.
  ///
  /// In tr, this message translates to:
  /// **'%2 sessiz hata hedefi bu örneklemle karşılanıyor.'**
  String get uiDogrulukHedefKarsilaniyor;

  /// No description provided for @uiDogrulukIcinDahaFazlaFis.
  ///
  /// In tr, this message translates to:
  /// **'%2 hedefini göstermek için daha fazla onaylı fiş gerekiyor (en az 150 yüksek güvenli alan).'**
  String get uiDogrulukIcinDahaFazlaFis;

  /// No description provided for @uiDogrulukNotu.
  ///
  /// In tr, this message translates to:
  /// **'Kaydettiğin değerler doğru kabul edilir. Ölçüm yalnızca bu telefonda yapılır ve hiçbir yere gönderilmez.'**
  String get uiDogrulukNotu;

  /// No description provided for @uiOkumaSorununuBildir.
  ///
  /// In tr, this message translates to:
  /// **'Okuma sorununu bildir'**
  String get uiOkumaSorununuBildir;

  /// No description provided for @uiOkumaRaporuAciklama.
  ///
  /// In tr, this message translates to:
  /// **'Yalnızca aşağıdaki metin paylaşılır. Fotoğraf, hesap bilgisi ve kaydettiğin değerler eklenmez; uzun numaralar ve plaka gizlenir.'**
  String get uiOkumaRaporuAciklama;

  /// No description provided for @uiPaylas.
  ///
  /// In tr, this message translates to:
  /// **'Paylaş'**
  String get uiPaylas;

  /// No description provided for @uiIstasyonAdresiIstegeBagli.
  ///
  /// In tr, this message translates to:
  /// **'İstasyon adresi (isteğe bağlı)'**
  String get uiIstasyonAdresiIstegeBagli;

  /// No description provided for @uiIstasyonKonumunuSec.
  ///
  /// In tr, this message translates to:
  /// **'İstasyon konumunu seç'**
  String get uiIstasyonKonumunuSec;

  /// No description provided for @uiKonumSecildiDegistir.
  ///
  /// In tr, this message translates to:
  /// **'Konum seçildi · değiştir'**
  String get uiKonumSecildiDegistir;

  /// No description provided for @uiKonumNoktasiEkle.
  ///
  /// In tr, this message translates to:
  /// **'Konum noktası ekle'**
  String get uiKonumNoktasiEkle;

  /// No description provided for @uiNoktaYalnizcaSenOnaylarsanKaydedilir.
  ///
  /// In tr, this message translates to:
  /// **'Nokta yalnızca sen onaylarsan kaydedilir.'**
  String get uiNoktaYalnizcaSenOnaylarsanKaydedilir;

  /// No description provided for @uiEnlem.
  ///
  /// In tr, this message translates to:
  /// **'Enlem'**
  String get uiEnlem;

  /// No description provided for @uiBoylam.
  ///
  /// In tr, this message translates to:
  /// **'Boylam'**
  String get uiBoylam;

  /// No description provided for @uiKilometreIstegeBagli.
  ///
  /// In tr, this message translates to:
  /// **'Kilometre (isteğe bağlı)'**
  String get uiKilometreIstegeBagli;

  /// No description provided for @uiTamDepo.
  ///
  /// In tr, this message translates to:
  /// **'Tam depo'**
  String get uiTamDepo;

  /// No description provided for @uiAractakiYakitSeviyesiniDegistirmez.
  ///
  /// In tr, this message translates to:
  /// **'Araçtaki yakıt seviyesini değiştirmez.'**
  String get uiAractakiYakitSeviyesiniDegistirmez;

  /// No description provided for @uiNotIstegeBagli.
  ///
  /// In tr, this message translates to:
  /// **'Not (isteğe bağlı)'**
  String get uiNotIstegeBagli;

  /// No description provided for @uiOkunanBilgileriKontrolEttimVeOnayliyorum.
  ///
  /// In tr, this message translates to:
  /// **'Okunan bilgileri kontrol ettim ve onaylıyorum.'**
  String get uiOkunanBilgileriKontrolEttimVeOnayliyorum;

  /// No description provided for @uiGarajFisFotografiniSunucusunaYuklemezFotograf.
  ///
  /// In tr, this message translates to:
  /// **'Garaj fiş fotoğrafını sunucusuna yüklemez. Fotoğraf yalnızca bu telefonda saklanır.'**
  String get uiGarajFisFotografiniSunucusunaYuklemezFotograf;

  /// No description provided for @uiBakimiDuzenle.
  ///
  /// In tr, this message translates to:
  /// **'Bakımı düzenle'**
  String get uiBakimiDuzenle;

  /// No description provided for @uiParcaTutarlariFaturaToplaminiAsiyorTutarlari.
  ///
  /// In tr, this message translates to:
  /// **'Parça tutarları fatura toplamını aşıyor. Tutarları kontrol edin.'**
  String get uiParcaTutarlariFaturaToplaminiAsiyorTutarlari;

  /// No description provided for @uiBakimTuru.
  ///
  /// In tr, this message translates to:
  /// **'Bakım türü'**
  String get uiBakimTuru;

  /// No description provided for @uiBaslik.
  ///
  /// In tr, this message translates to:
  /// **'Başlık'**
  String get uiBaslik;

  /// No description provided for @uiBakimTarihi.
  ///
  /// In tr, this message translates to:
  /// **'Bakım tarihi'**
  String get uiBakimTarihi;

  /// No description provided for @uiServisUsta.
  ///
  /// In tr, this message translates to:
  /// **'Servis / usta'**
  String get uiServisUsta;

  /// No description provided for @uiDegisenParcalar.
  ///
  /// In tr, this message translates to:
  /// **'Değişen parçalar'**
  String get uiDegisenParcalar;

  /// No description provided for @uiMotorYagi.
  ///
  /// In tr, this message translates to:
  /// **'Motor yağı'**
  String get uiMotorYagi;

  /// No description provided for @uiYagFiltresi.
  ///
  /// In tr, this message translates to:
  /// **'Yağ filtresi'**
  String get uiYagFiltresi;

  /// No description provided for @uiHavaFiltresi.
  ///
  /// In tr, this message translates to:
  /// **'Hava filtresi'**
  String get uiHavaFiltresi;

  /// No description provided for @uiPolenFiltresi.
  ///
  /// In tr, this message translates to:
  /// **'Polen filtresi'**
  String get uiPolenFiltresi;

  /// No description provided for @uiFrenBalatasi.
  ///
  /// In tr, this message translates to:
  /// **'Fren balatası'**
  String get uiFrenBalatasi;

  /// No description provided for @uiParcayiKaldir.
  ///
  /// In tr, this message translates to:
  /// **'Parçayı kaldır'**
  String get uiParcayiKaldir;

  /// No description provided for @uiOzelParcaAdi.
  ///
  /// In tr, this message translates to:
  /// **'Özel parça adı'**
  String get uiOzelParcaAdi;

  /// No description provided for @uiParcaTutariIstegeBagli.
  ///
  /// In tr, this message translates to:
  /// **'Parça tutarı (isteğe bağlı)'**
  String get uiParcaTutariIstegeBagli;

  /// No description provided for @uiParcayiEkle.
  ///
  /// In tr, this message translates to:
  /// **'Parçayı ekle'**
  String get uiParcayiEkle;

  /// No description provided for @uiOdeme.
  ///
  /// In tr, this message translates to:
  /// **'Ödeme'**
  String get uiOdeme;

  /// No description provided for @uiFaturaToplami.
  ///
  /// In tr, this message translates to:
  /// **'Fatura toplamı'**
  String get uiFaturaToplami;

  /// No description provided for @uiParcaTutarlariToplamMasrafaYenidenEklenmez.
  ///
  /// In tr, this message translates to:
  /// **'Parça tutarları toplam masrafa yeniden eklenmez.'**
  String get uiParcaTutarlariToplamMasrafaYenidenEklenmez;

  /// No description provided for @uiPeriyodikBakimSayaciniSifirla.
  ///
  /// In tr, this message translates to:
  /// **'Periyodik bakım sayacını sıfırla'**
  String get uiPeriyodikBakimSayaciniSifirla;

  /// No description provided for @uiMasrafiDuzenle.
  ///
  /// In tr, this message translates to:
  /// **'Masrafı düzenle'**
  String get uiMasrafiDuzenle;

  /// No description provided for @uiSifirdanBuyukBirTutarGirin.
  ///
  /// In tr, this message translates to:
  /// **'Sıfırdan büyük bir tutar girin.'**
  String get uiSifirdanBuyukBirTutarGirin;

  /// No description provided for @uiKategori.
  ///
  /// In tr, this message translates to:
  /// **'Kategori'**
  String get uiKategori;

  /// No description provided for @uiAciklama.
  ///
  /// In tr, this message translates to:
  /// **'Açıklama'**
  String get uiAciklama;

  /// No description provided for @uiOrnYillikTrafikSigortasi.
  ///
  /// In tr, this message translates to:
  /// **'Örn. yıllık trafik sigortası'**
  String get uiOrnYillikTrafikSigortasi;

  /// No description provided for @uiTutar.
  ///
  /// In tr, this message translates to:
  /// **'Tutar'**
  String get uiTutar;

  /// No description provided for @uiTarih.
  ///
  /// In tr, this message translates to:
  /// **'Tarih'**
  String get uiTarih;

  /// No description provided for @uiYakitVeBakimMasraflariKendiKayitlarindan.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt ve bakım masrafları kendi kayıtlarından otomatik gelir.'**
  String get uiYakitVeBakimMasraflariKendiKayitlarindan;

  /// No description provided for @uiKilometreyiGuncelle.
  ///
  /// In tr, this message translates to:
  /// **'Kilometreyi güncelle'**
  String get uiKilometreyiGuncelle;

  /// No description provided for @uiGostergePanelindekiKilometre.
  ///
  /// In tr, this message translates to:
  /// **'Gösterge panelindeki kilometre'**
  String get uiGostergePanelindekiKilometre;

  /// No description provided for @uiOkumaTarihi.
  ///
  /// In tr, this message translates to:
  /// **'Okuma tarihi'**
  String get uiOkumaTarihi;

  /// No description provided for @uiGecmisTarihliOkumalarGuncelKilometreniDusurmez.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş tarihli okumalar güncel kilometreni düşürmez. Çelişen değerler kaydedilmeden önce kontrol edilir.'**
  String get uiGecmisTarihliOkumalarGuncelKilometreniDusurmez;

  /// No description provided for @uiSikKullanilanlar.
  ///
  /// In tr, this message translates to:
  /// **'Sık kullanılanlar'**
  String get uiSikKullanilanlar;

  /// No description provided for @uiSilecekSuyuAz.
  ///
  /// In tr, this message translates to:
  /// **'Silecek suyu az'**
  String get uiSilecekSuyuAz;

  /// No description provided for @uiLastikBasinci.
  ///
  /// In tr, this message translates to:
  /// **'Lastik basıncı'**
  String get uiLastikBasinci;

  /// No description provided for @uiYagSeviyesi.
  ///
  /// In tr, this message translates to:
  /// **'Yağ seviyesi'**
  String get uiYagSeviyesi;

  /// No description provided for @uiArizaLambasi.
  ///
  /// In tr, this message translates to:
  /// **'Arıza lambası'**
  String get uiArizaLambasi;

  /// No description provided for @uiSogutmaSuyu.
  ///
  /// In tr, this message translates to:
  /// **'Soğutma suyu'**
  String get uiSogutmaSuyu;

  /// No description provided for @uiIhtiyacVeyaSorun.
  ///
  /// In tr, this message translates to:
  /// **'İhtiyaç veya sorun'**
  String get uiIhtiyacVeyaSorun;

  /// No description provided for @uiOnem.
  ///
  /// In tr, this message translates to:
  /// **'Önem'**
  String get uiOnem;

  /// No description provided for @uiBilgi.
  ///
  /// In tr, this message translates to:
  /// **'Bilgi'**
  String get uiBilgi;

  /// No description provided for @uiOncelikli.
  ///
  /// In tr, this message translates to:
  /// **'Öncelikli'**
  String get uiOncelikli;

  /// No description provided for @uiSorunCozulduOlarakIsaretleyeneKadarOzet.
  ///
  /// In tr, this message translates to:
  /// **'Sorun, çözüldü olarak işaretleyene kadar Özet ekranında görünür.'**
  String get uiSorunCozulduOlarakIsaretleyeneKadarOzet;

  /// No description provided for @uiTelefonunKonumunuAcipTekrarDene.
  ///
  /// In tr, this message translates to:
  /// **'Telefonun konumunu açıp tekrar dene.'**
  String get uiTelefonunKonumunuAcipTekrarDene;

  /// No description provided for @uiKonumIzniVerilmediHaritadanVeyaKoordinatla.
  ///
  /// In tr, this message translates to:
  /// **'Konum izni verilmedi. Haritadan veya koordinatla seçim yapabilirsin.'**
  String get uiKonumIzniVerilmediHaritadanVeyaKoordinatla;

  /// No description provided for @uiAdresBulunamadiKoordinatGirebilirsin.
  ///
  /// In tr, this message translates to:
  /// **'Adres bulunamadı. Koordinat girebilirsin.'**
  String get uiAdresBulunamadiKoordinatGirebilirsin;

  /// No description provided for @uiAdresBulunamadiHaritadanVeyaKoordinatlaSecim.
  ///
  /// In tr, this message translates to:
  /// **'Adres bulunamadı. Haritadan veya koordinatla seçim yapabilirsin.'**
  String get uiAdresBulunamadiHaritadanVeyaKoordinatlaSecim;

  /// No description provided for @uiIstasyonKonumunuOnayla.
  ///
  /// In tr, this message translates to:
  /// **'İstasyon konumunu onayla'**
  String get uiIstasyonKonumunuOnayla;

  /// No description provided for @uiYalnizcaSecipOnayladiginNoktaIstasyonaEklenir.
  ///
  /// In tr, this message translates to:
  /// **'Yalnızca seçip onayladığın nokta istasyona eklenir. Fişi başka bir yerde çektiysen şu anki konumunu kullanma.'**
  String get uiYalnizcaSecipOnayladiginNoktaIstasyonaEklenir;

  /// No description provided for @uiSuAnIstasyondayim.
  ///
  /// In tr, this message translates to:
  /// **'Şu an istasyondayım'**
  String get uiSuAnIstasyondayim;

  /// No description provided for @uiIstasyonAdresi.
  ///
  /// In tr, this message translates to:
  /// **'İstasyon adresi'**
  String get uiIstasyonAdresi;

  /// No description provided for @uiAdresiBul.
  ///
  /// In tr, this message translates to:
  /// **'Adresi bul'**
  String get uiAdresiBul;

  /// No description provided for @uiHenuzBirNoktaSecilmedi.
  ///
  /// In tr, this message translates to:
  /// **'Henüz bir nokta seçilmedi.'**
  String get uiHenuzBirNoktaSecilmedi;

  /// No description provided for @uiText10.
  ///
  /// In tr, this message translates to:
  /// **'{p0}, {p1}'**
  String uiText10(String p0, String p1);

  /// No description provided for @uiHaritaBaglantisiOlmadanKonumunuAlabilirVeya.
  ///
  /// In tr, this message translates to:
  /// **'Harita bağlantısı olmadan konumunu alabilir veya koordinat girebilirsin.'**
  String get uiHaritaBaglantisiOlmadanKonumunuAlabilirVeya;

  /// No description provided for @uiGecerliBirKonumSec.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir konum seç.'**
  String get uiGecerliBirKonumSec;

  /// No description provided for @uiBuNoktayiOnayla.
  ///
  /// In tr, this message translates to:
  /// **'Bu noktayı onayla'**
  String get uiBuNoktayiOnayla;

  /// No description provided for @uiDeleteRecordQuestion.
  ///
  /// In tr, this message translates to:
  /// **'Kaydı sil?'**
  String get uiDeleteRecordQuestion;

  /// No description provided for @uiDeleteIrreversible.
  ///
  /// In tr, this message translates to:
  /// **'Bu işlem geri alınamaz.'**
  String get uiDeleteIrreversible;

  /// No description provided for @uiNotYet.
  ///
  /// In tr, this message translates to:
  /// **'henüz yok'**
  String get uiNotYet;

  /// No description provided for @uiRead.
  ///
  /// In tr, this message translates to:
  /// **'Okundu'**
  String get uiRead;

  /// No description provided for @uiSuggestion.
  ///
  /// In tr, this message translates to:
  /// **'Öneri'**
  String get uiSuggestion;

  /// No description provided for @uiCalculated.
  ///
  /// In tr, this message translates to:
  /// **'Hesaplandı'**
  String get uiCalculated;

  /// No description provided for @uiNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Bulunamadı'**
  String get uiNotFound;

  /// No description provided for @uiManual.
  ///
  /// In tr, this message translates to:
  /// **'Manuel'**
  String get uiManual;

  /// No description provided for @uiDocumentScanner.
  ///
  /// In tr, this message translates to:
  /// **'Belge tarayıcı'**
  String get uiDocumentScanner;

  /// No description provided for @uiViewReceipt.
  ///
  /// In tr, this message translates to:
  /// **'Bu telefondaki fişi görüntüle'**
  String get uiViewReceipt;

  /// No description provided for @uiReceiptAbsent.
  ///
  /// In tr, this message translates to:
  /// **'Bu kayıt için bu telefonda fiş fotoğrafı yok.'**
  String get uiReceiptAbsent;

  /// No description provided for @uiReceiptPhoto.
  ///
  /// In tr, this message translates to:
  /// **'Yakıt fişi'**
  String get uiReceiptPhoto;

  /// No description provided for @uiText11.
  ///
  /// In tr, this message translates to:
  /// **'—'**
  String get uiText11;

  /// No description provided for @uiMotorBilgisiEklenmedi.
  ///
  /// In tr, this message translates to:
  /// **'Motor bilgisi eklenmedi'**
  String get uiMotorBilgisiEklenmedi;

  /// No description provided for @uiText12.
  ///
  /// In tr, this message translates to:
  /// **' · {p0}'**
  String uiText12(String p0);

  /// No description provided for @uiKaydediliyor.
  ///
  /// In tr, this message translates to:
  /// **'Kaydediliyor…'**
  String get uiKaydediliyor;

  /// No description provided for @uiTarihEkle.
  ///
  /// In tr, this message translates to:
  /// **'Tarih ekle'**
  String get uiTarihEkle;

  /// No description provided for @uiGecerliBirEPostaAdresiGirin.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir e-posta adresi girin.'**
  String get uiGecerliBirEPostaAdresiGirin;

  /// No description provided for @uiBaglantiKurulamadiTekrarDeneyin.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulamadı. Tekrar deneyin.'**
  String get uiBaglantiKurulamadiTekrarDeneyin;

  /// No description provided for @uiEPostadaki6HaneliKoduGirin.
  ///
  /// In tr, this message translates to:
  /// **'E-postadaki 6 haneli kodu girin.'**
  String get uiEPostadaki6HaneliKoduGirin;

  /// No description provided for @uiKodDogrulanamadiTekrarDeneyin.
  ///
  /// In tr, this message translates to:
  /// **'Kod doğrulanamadı. Tekrar deneyin.'**
  String get uiKodDogrulanamadiTekrarDeneyin;

  /// No description provided for @uiAraciniTaniBakiminiVeHarcamalariniTakip.
  ///
  /// In tr, this message translates to:
  /// **'Aracını tanı.\nBakımını ve harcamalarını takip et.'**
  String get uiAraciniTaniBakiminiVeHarcamalariniTakip;

  /// No description provided for @uiEPostaniKontrolEt.
  ///
  /// In tr, this message translates to:
  /// **'E-postanı kontrol et'**
  String get uiEPostaniKontrolEt;

  /// No description provided for @uiGarajinaGirisYap.
  ///
  /// In tr, this message translates to:
  /// **'Garajına giriş yap'**
  String get uiGarajinaGirisYap;

  /// No description provided for @uiEPostaAdresi.
  ///
  /// In tr, this message translates to:
  /// **'E-posta adresi'**
  String get uiEPostaAdresi;

  /// No description provided for @ui6HaneliKod.
  ///
  /// In tr, this message translates to:
  /// **'6 haneli kod'**
  String get ui6HaneliKod;

  /// No description provided for @uiLutfenBekleyin.
  ///
  /// In tr, this message translates to:
  /// **'Lütfen bekleyin'**
  String get uiLutfenBekleyin;

  /// No description provided for @uiGirisYap.
  ///
  /// In tr, this message translates to:
  /// **'Giriş yap'**
  String get uiGirisYap;

  /// No description provided for @uiGirisKoduGonder.
  ///
  /// In tr, this message translates to:
  /// **'Giriş kodu gönder'**
  String get uiGirisKoduGonder;

  /// No description provided for @uiEPostaAdresiniDegistir.
  ///
  /// In tr, this message translates to:
  /// **'E-posta adresini değiştir'**
  String get uiEPostaAdresiniDegistir;

  /// No description provided for @uiBulutBaglantisiHenuzYapilandirilmadi.
  ///
  /// In tr, this message translates to:
  /// **'Bulut bağlantısı henüz yapılandırılmadı.'**
  String get uiBulutBaglantisiHenuzYapilandirilmadi;

  /// No description provided for @uiSupabaseProjeBilgileriEklendigindeEPosta.
  ///
  /// In tr, this message translates to:
  /// **'Supabase proje bilgileri eklendiğinde e-posta ile giriş ve bulut yedekleme açılacak.'**
  String get uiSupabaseProjeBilgileriEklendigindeEPosta;

  /// No description provided for @uiYerelOnizlemeyiAc.
  ///
  /// In tr, this message translates to:
  /// **'Yerel önizlemeyi aç'**
  String get uiYerelOnizlemeyiAc;

  /// No description provided for @uiGelistirmeOnizlemesiVerilerYalnizcaBuCihazda.
  ///
  /// In tr, this message translates to:
  /// **'Geliştirme önizlemesi · Veriler yalnızca bu cihazda tutulur.'**
  String get uiGelistirmeOnizlemesiVerilerYalnizcaBuCihazda;

  /// No description provided for @uiFisFotograflarinCihazindaKalir.
  ///
  /// In tr, this message translates to:
  /// **'Fiş fotoğrafların cihazında kalır.'**
  String get uiFisFotograflarinCihazindaKalir;

  /// No description provided for @uiLicenses.
  ///
  /// In tr, this message translates to:
  /// **'Lisanslar'**
  String get uiLicenses;

  /// No description provided for @uiFistekiPlakaBaskaAracaAit.
  ///
  /// In tr, this message translates to:
  /// **'Fişteki plaka {p0}, garajındaki {p1} aracına ait. Seçili araç: {p2}.'**
  String uiFistekiPlakaBaskaAracaAit(String p0, String p1, String p2);

  /// No description provided for @uiBuAracaKaydet.
  ///
  /// In tr, this message translates to:
  /// **'Bu araca kaydet'**
  String get uiBuAracaKaydet;

  /// No description provided for @uiKayitBuAracaEklenecek.
  ///
  /// In tr, this message translates to:
  /// **'Bu kayıt {p0} ({p1}) aracına eklenecek. Uygulamada seçili araç değişmez.'**
  String uiKayitBuAracaEklenecek(String p0, String p1);

  /// No description provided for @uiSeciliAracaKaydet.
  ///
  /// In tr, this message translates to:
  /// **'Seçili araca kaydet'**
  String get uiSeciliAracaKaydet;

  /// No description provided for @uiPlakaEtiketi.
  ///
  /// In tr, this message translates to:
  /// **'Plaka {p0}'**
  String uiPlakaEtiketi(String p0);

  /// No description provided for @uiMasraflarSekmesi.
  ///
  /// In tr, this message translates to:
  /// **'Masraflar'**
  String get uiMasraflarSekmesi;

  /// No description provided for @uiAracDegistir.
  ///
  /// In tr, this message translates to:
  /// **'Aracı değiştir'**
  String get uiAracDegistir;

  /// No description provided for @uiGarajim.
  ///
  /// In tr, this message translates to:
  /// **'Garajım'**
  String get uiGarajim;

  /// No description provided for @uiHerSeyYolunda.
  ///
  /// In tr, this message translates to:
  /// **'Her şey yolunda'**
  String get uiHerSeyYolunda;

  /// No description provided for @uiKonuDikkatIstiyor.
  ///
  /// In tr, this message translates to:
  /// **'{p0} konu dikkat istiyor'**
  String uiKonuDikkatIstiyor(String p0);

  /// No description provided for @uiGundem.
  ///
  /// In tr, this message translates to:
  /// **'Gündem'**
  String get uiGundem;

  /// No description provided for @uiGundemBos.
  ///
  /// In tr, this message translates to:
  /// **'Gündemde bir şey yok'**
  String get uiGundemBos;

  /// No description provided for @uiGundemBosAciklama.
  ///
  /// In tr, this message translates to:
  /// **'Belge tarihleri yaklaştığında ve uyarılar çıktığında burada görünür.'**
  String get uiGundemBosAciklama;

  /// No description provided for @uiBuAy.
  ///
  /// In tr, this message translates to:
  /// **'Bu ay'**
  String get uiBuAy;

  /// No description provided for @uiGuncelle.
  ///
  /// In tr, this message translates to:
  /// **'Güncelle'**
  String get uiGuncelle;

  /// No description provided for @uiSonrakiBakimEtiketi.
  ///
  /// In tr, this message translates to:
  /// **'Sonraki bakım'**
  String get uiSonrakiBakimEtiketi;

  /// No description provided for @uiBakimaKalan.
  ///
  /// In tr, this message translates to:
  /// **'Bakıma kalan'**
  String get uiBakimaKalan;

  /// No description provided for @uiBakimGecti.
  ///
  /// In tr, this message translates to:
  /// **'Bakım geçti'**
  String get uiBakimGecti;

  /// No description provided for @uiHangisiOnceGelirse.
  ///
  /// In tr, this message translates to:
  /// **'{p0} ya da {p1}, hangisi önce gelirse.'**
  String uiHangisiOnceGelirse(String p0, String p1);

  /// No description provided for @uiSonrakiBakimTarihi.
  ///
  /// In tr, this message translates to:
  /// **'Sonraki bakım: {p0}.'**
  String uiSonrakiBakimTarihi(String p0);

  /// No description provided for @uiKilometre.
  ///
  /// In tr, this message translates to:
  /// **'Kilometre'**
  String get uiKilometre;

  /// No description provided for @uiSure.
  ///
  /// In tr, this message translates to:
  /// **'Süre'**
  String get uiSure;

  /// No description provided for @uiAralik.
  ///
  /// In tr, this message translates to:
  /// **'{p0} → {p1}'**
  String uiAralik(String p0, String p1);

  /// No description provided for @uiBakimOzetiSemantik.
  ///
  /// In tr, this message translates to:
  /// **'{p0}: {p1}. {p2} Durum: {p3}.'**
  String uiBakimOzetiSemantik(String p0, String p1, String p2, String p3);

  /// No description provided for @uiHarcama.
  ///
  /// In tr, this message translates to:
  /// **'Harcama'**
  String get uiHarcama;

  /// No description provided for @uiGecenAy.
  ///
  /// In tr, this message translates to:
  /// **'Geçen ay {p0}'**
  String uiGecenAy(String p0);

  /// No description provided for @uiBuAyYakitYok.
  ///
  /// In tr, this message translates to:
  /// **'Bu ay yakıt alınmadı'**
  String get uiBuAyYakitYok;

  /// No description provided for @uiOrtalamaFiyat.
  ///
  /// In tr, this message translates to:
  /// **'Ort. {p0} / L'**
  String uiOrtalamaFiyat(String p0);

  /// No description provided for @uiKayitToplam.
  ///
  /// In tr, this message translates to:
  /// **'{p0} kayıt · toplam {p1}'**
  String uiKayitToplam(String p0, String p1);

  /// No description provided for @uiSayaciSifirladi.
  ///
  /// In tr, this message translates to:
  /// **'Bakım sayacını sıfırladı'**
  String get uiSayaciSifirladi;

  /// No description provided for @uiToplam.
  ///
  /// In tr, this message translates to:
  /// **'Toplam'**
  String get uiToplam;

  /// No description provided for @uiOncekiDonemToplami.
  ///
  /// In tr, this message translates to:
  /// **'Önceki dönem {p0}'**
  String uiOncekiDonemToplami(String p0);

  /// No description provided for @uiKategoriler.
  ///
  /// In tr, this message translates to:
  /// **'Kategoriler'**
  String get uiKategoriler;

  /// No description provided for @uiOrtalamaLitreFiyati.
  ///
  /// In tr, this message translates to:
  /// **'Ortalama'**
  String get uiOrtalamaLitreFiyati;

  /// No description provided for @uiMasraf.
  ///
  /// In tr, this message translates to:
  /// **'Masraf'**
  String get uiMasraf;

  /// No description provided for @uiHemenIlgilen.
  ///
  /// In tr, this message translates to:
  /// **'Hemen ilgilen'**
  String get uiHemenIlgilen;

  /// No description provided for @uiYakindaIlgilen.
  ///
  /// In tr, this message translates to:
  /// **'Yakında ilgilen'**
  String get uiYakindaIlgilen;

  /// No description provided for @uiBilgiNotlari.
  ///
  /// In tr, this message translates to:
  /// **'Bilgi'**
  String get uiBilgiNotlari;

  /// No description provided for @uiSistem.
  ///
  /// In tr, this message translates to:
  /// **'Sistem'**
  String get uiSistem;

  /// No description provided for @uiAcik.
  ///
  /// In tr, this message translates to:
  /// **'Açık'**
  String get uiAcik;

  /// No description provided for @uiGorunumAciklama.
  ///
  /// In tr, this message translates to:
  /// **'Sistem, telefonun açık ya da koyu ayarını izler. Gündüz pompa başında açık tema daha kolay okunur.'**
  String get uiGorunumAciklama;

  /// No description provided for @uiBildirimler.
  ///
  /// In tr, this message translates to:
  /// **'Bildirimler'**
  String get uiBildirimler;

  /// No description provided for @uiHakkinda.
  ///
  /// In tr, this message translates to:
  /// **'Hakkında'**
  String get uiHakkinda;

  /// No description provided for @uiMotorVeKilometre.
  ///
  /// In tr, this message translates to:
  /// **'Motor ve kilometre'**
  String get uiMotorVeKilometre;

  /// No description provided for @uiGirisFaydaHatirlatma.
  ///
  /// In tr, this message translates to:
  /// **'Bakım, muayene ve sigorta tarihlerini zamanında hatırlatır.'**
  String get uiGirisFaydaHatirlatma;

  /// No description provided for @uiGirisFaydaFis.
  ///
  /// In tr, this message translates to:
  /// **'Fişi okutur; yakıtı ve masrafı kendisi ayırır.'**
  String get uiGirisFaydaFis;

  /// No description provided for @uiHenuzGirilmedi.
  ///
  /// In tr, this message translates to:
  /// **'Henüz girilmedi · dokunarak ekle'**
  String get uiHenuzGirilmedi;

  /// No description provided for @uiGirisSlogan.
  ///
  /// In tr, this message translates to:
  /// **'Aracının bakımı, yakıtı ve masrafları tek defterde.'**
  String get uiGirisSlogan;

  /// No description provided for @uiHesapDegistiFormuYenidenAc.
  ///
  /// In tr, this message translates to:
  /// **'Hesap değişti. Bu formu kendi hesabında yeniden aç.'**
  String get uiHesapDegistiFormuYenidenAc;

  /// No description provided for @uiIsaretliAlanlariKontrolEt.
  ///
  /// In tr, this message translates to:
  /// **'Kırmızıyla işaretli alanları kontrol et.'**
  String get uiIsaretliAlanlariKontrolEt;

  /// No description provided for @uiGecerliBirTamSayiGirin.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir tam sayı girin'**
  String get uiGecerliBirTamSayiGirin;

  /// No description provided for @uiDegerAraligi.
  ///
  /// In tr, this message translates to:
  /// **'{p0} ile {p1} arasında olmalı'**
  String uiDegerAraligi(String p0, String p1);

  /// No description provided for @uiGecerliBirKilometreGirin.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir kilometre girin'**
  String get uiGecerliBirKilometreGirin;

  /// No description provided for @uiKayitSunucudaKabulEdilmedi.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt sunucuda kabul edilmedi'**
  String get uiKayitSunucudaKabulEdilmedi;

  /// No description provided for @uiKayitGonderilemedi.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt bu cihazdan gönderilemedi'**
  String get uiKayitGonderilemedi;

  /// No description provided for @uiKonumAlinamadi.
  ///
  /// In tr, this message translates to:
  /// **'Konum alınamadı. Açık bir alanda tekrar dene ya da haritadan seç.'**
  String get uiKonumAlinamadi;

  /// No description provided for @uiFistenBilgiOkunamadi.
  ///
  /// In tr, this message translates to:
  /// **'Fişten bilgi okunamadı. Alanları elle doldur ya da fişi yeniden çek.'**
  String get uiFistenBilgiOkunamadi;

  /// No description provided for @uiFisiKirp.
  ///
  /// In tr, this message translates to:
  /// **'Fişi kırp'**
  String get uiFisiKirp;

  /// No description provided for @uiTamam.
  ///
  /// In tr, this message translates to:
  /// **'Tamam'**
  String get uiTamam;

  /// No description provided for @uiBekleyenDegisiklikGosteriliyor.
  ///
  /// In tr, this message translates to:
  /// **'Bu kaydın henüz gönderilmemiş bir değişikliği var; form son hâlini gösteriyor.'**
  String get uiBekleyenDegisiklikGosteriliyor;

  /// No description provided for @uiUzunSuredirBekleyenKayit.
  ///
  /// In tr, this message translates to:
  /// **'Uzun süredir bekleyen kayıt'**
  String get uiUzunSuredirBekleyenKayit;

  /// No description provided for @uiYineDeGonder.
  ///
  /// In tr, this message translates to:
  /// **'Yine de gönder'**
  String get uiYineDeGonder;

  /// No description provided for @uiKayitSuAnGonderiliyor.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt şu an gönderiliyor; artık kaldırılamaz.'**
  String get uiKayitSuAnGonderiliyor;

  /// No description provided for @uiEnFazlaKarakter.
  ///
  /// In tr, this message translates to:
  /// **'En fazla {p0} karakter olabilir'**
  String uiEnFazlaKarakter(String p0);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
