import 'package:digital_awareness_app/data/repo/report_card_data.dart';
import 'package:digital_awareness_app/view/report/report_card_widget.dart';

import 'package:flutter/material.dart';

class ReportBullyingScreen extends StatelessWidget {
  const ReportBullyingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReportCards(),
          ],
        ),
      ),
    );
  }

  // Rapor kartlarını oluşturan yöntem
  static Widget _buildReportCards() {
    return Column(
      children: ReportCardData.reportItems
          .map((item) => ReportCardWidget(
                title: item.title,
                description: item.description,
                linkText: item.linkText,
                linkUrl: item.linkUrl,
              ))
          .toList(),
    );
  }
}
