import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  final String title;
  final String url;
  const DetailScreen({super.key, required this.url, required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String articleContent = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWikipediaArticle();
  }

  String convertToApiLink(String wikiUrl) {
    // URL'yi parçalayarak başlık kısmını alıyoruz.
    final uri = Uri.parse(wikiUrl);
    final title = uri.pathSegments.last;

    // API linkini oluşturuyoruz.
    final apiLink = 'https://tr.wikipedia.org/w/api.php'
        '?action=query&prop=extracts&format=json'
        '&titles=$title&formatversion=2&explaintext=1';

    return apiLink;
  }

  Future<void> fetchWikipediaArticle() async {
    // Wikipedia API'den veri çekmek için URL
    final apiLink = convertToApiLink(widget.url);
    final url = Uri.parse(apiLink);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final page = data['query']['pages'][0];
        final extract = page['extract'];

        setState(() {
          articleContent = extract;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load article');
      }
    } catch (e) {
      setState(() {
        articleContent = 'An error occurred while fetching the article.';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(articleContent),
              ),
            ),
    );
  }
}
