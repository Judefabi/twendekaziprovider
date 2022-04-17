import 'package:flutter/material.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: Color(0xFF979797).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          child: TextField(
            onChanged: (value) => print(value),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search provider",
                prefixIcon: Icon(Icons.search)),
          ),
        ),
      ),
    );
  }
}
