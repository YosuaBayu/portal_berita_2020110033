import 'package:flutter/material.dart';
import 'package:portal_berita_pknews/components/news.dart';
import 'package:portal_berita_pknews/providers/news.provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('cari berita'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: 'Cari Berita ...',
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {
                      news.search(searchController.text);
                    }, icon: Icon(Icons.send)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                news.isDataEmpty
                    ? const SizedBox()
                    : news.isLoadingSearch
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            children: [
                              ...news.resSearch!.articles!.map(
                                (e) => News(
                                  title: e.title ?? '',
                                  image: e.urlToImage ?? '',
                                ),
                              )
                            ],
                          ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
