import 'package:digital_awareness_app/data/repo/emergency_contact_data.dart';
import 'package:digital_awareness_app/view/home/home_widgets/carousel_widget.dart';
import 'package:digital_awareness_app/view/home/home_widgets/custom_card.dart';
import 'package:digital_awareness_app/view/home/home_widgets/custom_search_bar.dart.dart';
import 'package:digital_awareness_app/view/home/home_widgets/emergency_carousel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  final EmergencyContactData contactData = EmergencyContactData();

  void _onCardTap(String url) {
    print('Card tapped with URL: $url');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CustomSearchBar(),
              ),
              const SizedBox(height: 10),
              const CarouselWidget(
                imagePaths: [
                  'assets/digitalfour.jpg',
                  'assets/digitalone.jpg',
                  'assets/digitalsix.jpg',
                  'assets/digitaltwo.jpg',
                ],
              ),
              const SizedBox(height: 10),
              EmergencyCarousel(
                emergencyContacts: contactData.emergencyContacts,
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  CustomCard(
                    title: 'Siber Zorbalık',
                    url: 'https://tr.wikipedia.org/wiki/Siber_zorbal%C4%B1k',
                  ),
                  CustomCard(
                    title: 'Kişisel Veri',
                    url: 'https://tr.wikipedia.org/wiki/Ki%C5%9Fisel_veri',
                  ),
                  CustomCard(
                    title: 'İnternet Güvenliği',
                    url:
                        'https://tr.wikipedia.org/wiki/%C4%B0nternet_g%C3%BCvenli%C4%9Fi',
                  ),
                  CustomCard(
                    title: 'Israrlı Siber Takip',
                    url:
                        'https://tr.wikipedia.org/wiki/Israrl%C4%B1_siber_takip',
                  ),
                  CustomCard(
                    title: 'Gizlilik',
                    url: 'https://tr.wikipedia.org/wiki/Gizlilik',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
