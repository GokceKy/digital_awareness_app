import 'package:digital_awareness_app/product/widgets/custom_app_bar.dart';
import 'package:digital_awareness_app/view/home/home_screen.dart';
import 'package:digital_awareness_app/view/profile/profile_screen.dart';
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
    HomeScreen(), // 0 - Home
    const Center(child: Text('Help Page')), // 1 - Help
    const Center(child: Text('Clear Page')), // 2 - Clear
    ProfileScreen(), // 3 - Profile
  ];

  // Sayfa başlıklarının listesi
  final List<String> _titles = [
    'Home', // Title for Home
    'Help', // Title for Help
    'Clear', // Title for Clear
    'Profile', // Title for Profile
  ];

  // İkonlardan birine tıklandığında çalışacak fonksiyon
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: _titles[_selectedIndex]), // Dynamic title
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
                icon: Icon(Icons.help_outline),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.clear),
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
