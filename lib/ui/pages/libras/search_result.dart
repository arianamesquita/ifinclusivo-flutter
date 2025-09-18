
import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/search_result_block.dart';

class SearchResult extends StatelessWidget{
  SearchResult({super.key});

  final items = [
    SearchResultBlock(topicName: 'html', description: 'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...'),
    SearchResultBlock(topicName: 'html', description: 'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...'),
    SearchResultBlock(topicName: 'html', description: 'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...'),
    SearchResultBlock(topicName: 'html', description: 'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items.isNotEmpty ? ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SearchResultBlock(topicName: item.topicName, description: item.description);
        }
      ) : SearchNotFound(),
    );
  }
}

class SearchNotFound extends StatelessWidget{
  const SearchNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Placeholder();
  }
}