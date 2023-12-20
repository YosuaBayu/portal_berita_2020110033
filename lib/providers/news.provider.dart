import 'package:flutter/material.dart';
import 'package:portal_berita_pknews/helpers/api.dart';
import 'package:portal_berita_pknews/models/topnews.model.dart';
import 'package:portal_berita_pknews/utils/const.dart';

class NewsProvider with ChangeNotifier {
  bool isDataEmpty = true;
  bool isLoading = true;
  bool isLoadingSearch = true;
  TopNewsModel? resNews;
  TopNewsModel? resSearch;
  String url = baseUrl;

  getTopNews() async {
//memanggil API GET NEWS
    final res = await api('${baseUrl}top-headlines?country=us&apiKey=$apiKey');

    if (res.statusCode == 200) {
      resNews = TopNewsModel.fromJson(res.data);
    } else {
      resNews = TopNewsModel();
    }
    isLoading = false;
    notifyListeners();
  }

  search(String search) async {
    isDataEmpty = false;
    isLoadingSearch = true;
    notifyListeners();

    final res = await api(
        '${baseUrl}everything?q=${search}&sortBy=popularity&apiKey=$apiKey');

    if (res.statusCode == 200) {
      resSearch = TopNewsModel.fromJson(res.data);
    } else {
      resSearch = TopNewsModel();
    }
    isLoadingSearch = false;
    notifyListeners();
  }
}
