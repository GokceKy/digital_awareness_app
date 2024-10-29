import 'package:digital_awareness_app/product/widgets/custom_app_bar.dart';
import 'package:digital_awareness_app/view/chat/chat_screen.dart';
import 'package:digital_awareness_app/view/education/course_screen.dart';
import 'package:digital_awareness_app/view/home/home_screen.dart';
import 'package:digital_awareness_app/view/profile/profile_screen.dart';
import 'package:digital_awareness_app/view/report/report_bullying_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  // Sayfaların listesi
  final List<Widget> _pages = [
    HomeScreen(),
    CourseScreen(),
    ChatScreen(),
    ReportBullyingScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Eğitimler kurslar',
    'DanışmanAI',
    'Dijital Zorbalığı İhbar Et',
    'Profile',
  ];
//sk-1drX7XIoDQ49lqBgmWu76_TcOxMsJurqpShv1hFaYsT3BlbkFJ_fHY4Yw2I2MZH-noPmrffNdAJ2t0ua1q74HXN_HRsA
  // İkonlardan birine tıklandığında çalışacak fonksiyon
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: _titles[_selectedIndex]),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary,
                  offset: const Offset(0, 7),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
          NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.laptop_chromebook_rounded),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.android),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.report_gmailerrorred_outlined),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
