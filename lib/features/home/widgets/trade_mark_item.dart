import 'package:flutter/material.dart';

import 'package:engaz/features/home/models/get_all_company_model.dart'; // Import the model

class TradeMarkItem extends StatelessWidget {
  final Companies company;

  const TradeMarkItem({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Color(0XFFDBEFB8),
      child: Image.network(
        '${company.logo}',
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const CircularProgressIndicator();
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
      ),
    );
  }
}
