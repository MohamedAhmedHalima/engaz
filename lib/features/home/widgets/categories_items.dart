import 'package:flutter/material.dart';

class CategoriesItems extends StatelessWidget {
  final String ?imageUrl;
  final String name;

  const CategoriesItems({
    super.key,
      this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    const baseUrl = 'http://194.164.77.238:8005';

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.30),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Column(
          children: [
            Image.network(
               imageUrl ??"https://fakeimg.pl/300/",
              width: 100,
              height: 100,
            ),
            Text(name, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
