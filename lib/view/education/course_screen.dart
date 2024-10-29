import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_awareness_app/view/education/course_card_widget.dart';

import 'package:digital_awareness_app/view/home/home_widgets/custom_search_bar.dart.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
        future:
            FirebaseFirestore.instance.collection('coursesCollection').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Bir hata oluştu: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Hiç veri bulunamadı'));
          }

          final courseItems = snapshot.data!.docs;
          // Sort documents by ID in descending order
          courseItems.sort((a, b) => b.id.compareTo(a.id));

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomSearchBar(),
              ),
              Expanded(
                // Use Expanded here
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: courseItems.length,
                  itemBuilder: (context, index) {
                    final data =
                        courseItems[index].data() as Map<String, dynamic>;
                    return CourseCardWidget(
                      courseImage: data['courseImage'] ?? '',
                      courseName: data['courseName'] ?? 'No Course Name',
                      courseDescription:
                          data['courseDescription'] ?? 'No Description',
                      courseLink: data['courseLink'] ?? '',
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
