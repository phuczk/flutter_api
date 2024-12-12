import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          labelText: 'Search',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36.0),
            borderSide: const BorderSide(color: Colors.white, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36.0),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 243, 170, 33), width: 1.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36.0),
            borderSide: const BorderSide(color: Colors.white, width: 1.5),
          ),
        ),
        onSubmitted: (title) {
          if (title.isNotEmpty) {
            textController.clear();
          } else {
            print("khong co title");
          }
        },
      ),
    );
  }
}
