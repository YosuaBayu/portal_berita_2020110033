import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:portal_berita_pknews/components/news.dart';
import 'package:portal_berita_pknews/pages/search.page.dart';
import 'package:portal_berita_pknews/providers/news.provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('LIKMI NEWS!'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 150.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            )
          ],
        ),
        body: Container(
          color: Color.fromARGB(255, 16, 231, 206), 
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  news.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            ...news.resNews!.articles!.map(
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
        ),
      );
    });
  }
}
