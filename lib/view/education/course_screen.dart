import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_awareness_app/view/education/course_card_widget.dart';

import 'package:digital_awareness_app/view/home/home_widgets/custom_search_bar.dart.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<String> selectedCategoryIds = [];

  Future<List<Map<String, dynamic>>> _fetchCategories() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('categories').get();
    return snapshot.docs.map((doc) {
      return {
        'id': doc.id,
        'name': doc['name'],
      };
    }).toList();
  }

  Future<List<QueryDocumentSnapshot>> _fetchCourses() async {
    Query coursesQuery =
        FirebaseFirestore.instance.collection('coursesCollection');

    if (selectedCategoryIds.isNotEmpty) {
      // Create a list of category references
      List<DocumentReference> categoryRefs = selectedCategoryIds.map((id) {
        return FirebaseFirestore.instance.collection('categories').doc(id);
      }).toList();
      // Fetch courses that match any of the selected category references
      coursesQuery =
          coursesQuery.where('categoryIDs', arrayContainsAny: categoryRefs);
    }

    final snapshot = await coursesQuery.get();
    return snapshot.docs;
  }

  void _toggleCategory(String categoryId) {
    setState(() {
      if (selectedCategoryIds.contains(categoryId)) {
        selectedCategoryIds.remove(categoryId); // Deselect the category
      } else {
        selectedCategoryIds.add(categoryId); // Select the category
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: CustomSearchBar(),
          ),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: _fetchCategories(),
            builder: (context, categorySnapshot) {
              if (categorySnapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                );
              }

              if (categorySnapshot.hasError) {
                return Center(
                    child: Text(
                        "Kategoriler yüklenemedi: ${categorySnapshot.error}"));
              }

              final categories = categorySnapshot.data ?? [];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((category) {
                      bool isSelected =
                          selectedCategoryIds.contains(category['id']);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _toggleCategory(category['id']);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected
                                ? Theme.of(context).colorScheme.secondary
                                : null, // Change color if selected
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(category['name']),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: FutureBuilder<List<QueryDocumentSnapshot>>(
              future: _fetchCourses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                      child: Text("Bir hata oluştu: ${snapshot.error}"));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('Bu kategoride kurs bulunamadı'));
                }

                final courseItems = snapshot.data!;
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
