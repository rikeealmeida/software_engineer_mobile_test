import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChange;
  const CustomSearchField({
    super.key,
    required this.controller,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xfff0f1f2),
          borderRadius: BorderRadius.circular(25)),
      child: TextField(
          controller: controller,
          onChanged: onChange,
          style: TextStyle(color: Colors.black.withOpacity(.5)),
          cursorColor: Colors.black.withOpacity(.5),
          decoration: InputDecoration(
              hintText: 'Search Anything',
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.black.withOpacity(.5)),
              ),
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none))),
    );
  }
}
