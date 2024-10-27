// report_card_data.dart
import 'package:digital_awareness_app/data/model/report_card_item.dart';

class ReportCardData {
  static List<ReportCardItem> get reportItems => [
        ReportCardItem(
          title:
              'Emniyet Genel Müdürlüğü Siber Suçlarla Mücadele Daire Başkanlığı (EGM)',
          description:
              'Siber zorbalık, siber takip veya kimlik hırsızlığı gibi suçları bildirmek için Türkiye Emniyet Genel Müdürlüğü\'ne başvurabilirsiniz. Online ihbar sistemi üzerinden başvuru yapılabilir.',
          linkText: 'Online İhbar Sistemi',
          linkUrl: 'https://www.egm.gov.tr/siber/',
        ),
        ReportCardItem(
          title: 'İnternet Bilgi İhbar Merkezi (İBİM)',
          description:
              'Türkiye Bilgi Teknolojileri ve İletişim Kurumu (BTK) tarafından yönetilen bu merkez, zararlı içerikleri şikayet etmek için kullanılabilir. Çocuk istismarı, özel hayatın gizliliğinin ihlali gibi durumları bildirmek için uygundur.',
          linkText: 'İBİM Şikayet Formu',
          linkUrl: 'https://www.btk.gov.tr/tr-TR/Denetim/ibim',
        ),
        ReportCardItem(
          title: 'CİMER (Cumhurbaşkanlığı İletişim Merkezi)',
          description:
              'CİMER üzerinden siber zorbalık veya kimlik hırsızlığı gibi olaylar hakkında ihbarda bulunulabilir. İlgili kurumlara yönlendirilmesini sağlar.',
          linkText: 'CİMER Başvuru',
          linkUrl: 'https://www.cimer.gov.tr/',
        ),
        ReportCardItem(
          title: 'Aile ve Sosyal Hizmetler Bakanlığı',
          description:
              'Özellikle çocuklar, gençler veya aile bireyleri siber zorbalık mağduruysa, Aile ve Sosyal Hizmetler Bakanlığı’nın destek hizmetlerine başvurulabilir. Bakanlık, aile ve çocuklara yönelik siber zorbalık konularında destek sağlamakta ve gerekli durumlarda hukuki süreç hakkında rehberlik edebilmektedir.',
          linkText: 'Alo 183 Sosyal Destek Hattı',
          linkUrl: 'https://www.aile.gov.tr/',
        ),
        ReportCardItem(
          title: 'Alo 550 Siber Suçlarla Mücadele Hattı',
          description:
              'Türkiye’deki bu özel telefon hattı, vatandaşların siber suçları ihbar etmesine olanak tanır. 24 saat erişim sunarak siber zorbalık gibi konularda ihbarda bulunmak isteyenlere hızlı bir erişim sağlar.',
          linkText: 'Alo 550 İletişim',
          linkUrl: 'https://www.egm.gov.tr/siber/',
        ),
        ReportCardItem(
          title: 'Sosyal Medya Platformları',
          description:
              'Siber zorbalığın çoğunlukla sosyal medya üzerinden gerçekleştiği durumlarda, platformların şikayet seçenekleri kullanılabilir. Instagram, Facebook, Twitter gibi platformlarda uygunsuz içerik veya taciz bildirim seçenekleri mevcuttur.',
          linkText: 'Sosyal Medya Şikayetleri',
          linkUrl:
              'https://www.instagram.com/; https://www.facebook.com/; https://twitter.com/',
        ),
      ];
}
