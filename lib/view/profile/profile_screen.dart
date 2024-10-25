import 'package:digital_awareness_app/product/theme/theme_provider.dart';
import 'package:digital_awareness_app/product/widgets/my_button.dart';
import 'package:digital_awareness_app/view/profile/profile_widgets/profile_photo.dart';
import 'package:digital_awareness_app/view/profile/profile_widgets/profile_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfilePhoto(
              imageUrl: user.photoURL ??
                  'https://archive.org/download/default_profile//images_thumb.jpg',
              onTap: () {
                // Profil fotoğrafını değiştirmek için gereken işlemler
                print('Profil fotoğrafı değiştiriliyor...');
              },
            ),
            const SizedBox(height: 16),
            Text('Welcome : ${user.email!}'),
            const SizedBox(height: 16),
            ProfileItem(
              leftIcon: Icons.person_outline_outlined,
              text: 'My Account',
              rightIcon: Icons.arrow_forward_ios_rounded,
              onTap: () {
                print('Ayarlar tıklandı');
              },
            ),
            const SizedBox(height: 16),
            ProfileItem(
              leftIcon: Icons.settings,
              text: 'Ayarlar',
              rightIcon: Icons.arrow_forward_ios_rounded,
              onTap: () {
                print('Ayarlar tıklandı');
              },
            ),
            const SizedBox(height: 16),
            ProfileItem(
              leftIcon: Icons.notifications_none_outlined,
              text: 'Notifitations',
              rightIcon: Icons.arrow_forward_ios_rounded,
              onTap: () {
                print(' tıklandı');
              },
            ),
            const SizedBox(height: 16),
            ProfileItem(
              leftIcon: Icons.help,
              text: 'Help Center',
              rightIcon: Icons.arrow_forward_ios_rounded,
              onTap: () {
                print('tıklandı');
              },
            ),
            const SizedBox(height: 16),
            MyButton(
              color: Theme.of(context).colorScheme.secondary,
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
