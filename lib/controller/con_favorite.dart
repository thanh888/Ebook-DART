import 'package:dio/dio.dart';
import 'package:ebook_app/controller/api.dart';
import 'package:ebook_app/model/ebook/model_ebook.dart';

Future<List<ModelEbook>> fetchFavorite(List<ModelEbook> fetch, String id) async {
  var request = await Dio()
      .get(ApiConstant().baseUrl() + ApiConstant().api + ApiConstant().favorite + id);

  for (Map<String, dynamic> ebook in request.data) {
    fetch.add(ModelEbook(
        id: ebook['id'],
        title: ebook['title'],
        photo: ebook['photo'],
        description: ebook['description'],
        catId: ebook['cat_id'],
        statusNews: ebook['status_news'],
        pdf: ebook['pdf'],
        date: ebook['date'],
        authorName: ebook['author_name'],
        publisherName: ebook['author_name'],
        pages: ebook['pages'],
        language: ebook['author_name'],
        rating: ebook['rating'],
        free: ebook['free']));
  }
  return fetch;
}
