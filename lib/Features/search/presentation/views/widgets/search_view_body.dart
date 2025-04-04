import 'package:flutter/material.dart';

import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Column(
        children: [
          CustomSearchTextFeild(),
          SizedBox(
            height: 20,
          ),
          Expanded(child: ResultSearchView())
        ],
      ),
    );
  }
}

class ResultSearchView extends StatelessWidget {
  const ResultSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            // child: BestSelletListViewItem(),
            child: Text("data"),
          );
        });
  }
}
