import 'package:digital_awareness_app/data/model/emergency_contact.dart';

class EmergencyContactData {
  final List<EmergencyContact> emergencyContacts = [
    EmergencyContact(
      title: "Alo 155 Polis İmdat",
      number: "155",
      description:
          "Çevrim içi ihbar için Emniyet Genel Müdürlüğü'nün Siber Suçlarla Mücadele Dairesi Başkanlığı web sitesinden de şikayetlerde bulunabilirsiniz.",
    ),
    EmergencyContact(
      title: "Alo 550 Siber Suçlar",
      number: "550",
      description:
          "Siber suçlarla mücadele hattı.Siber zorbalık gibi konularda ihbarda bulunmak isteyenlere hızlı bir erişim sağlar",
    ),
    EmergencyContact(
      title: "ALO 112 – Acil Yardım Hattı",
      number: "112",
      description:
          "Acil bir tehdit veya tehlike durumunda polise, ambulansa veya itfaiyeye ulaşılabilir.",
    ),
    EmergencyContact(
      title: "Alo 183 Sosyal Destek Hattı",
      number: "183",
      description:
          "Aile, kadın, çocuk ve sosyal hizmetlerle ilgili destek ve danışmanlık sağlar.",
    ),
  ];
}
