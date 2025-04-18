import 'package:flutter/material.dart';
import 'package:weather/views/screens/search/widgets/search_icon.dart';
import 'package:weather/views/screens/search/widgets/search_text_field.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SearchTextField(),
        SizedBox(width: 8),
        SearchIcon(),
      ],
    );
  }
}
