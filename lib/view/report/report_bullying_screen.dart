import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_awareness_app/view/report/report_card_widget.dart';
import 'package:flutter/material.dart';

class ReportBullyingScreen extends StatelessWidget {
  const ReportBullyingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('reportCollection').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
                child: Text("Something went wrong: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          final reportItems = snapshot.data!.docs;
          // Belge ID'lerine göre büyükten küçüğe sıralama
          reportItems.sort((a, b) => b.id.compareTo(a.id));

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: reportItems.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                return ReportCardWidget(
                  title: data['title'] ?? 'No Title',
                  description: data['description'] ?? 'No Description',
                  linkText: data['linkText'] ?? 'No Link Text',
                  linkUrl: data['linkUrl'] ?? '',
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
