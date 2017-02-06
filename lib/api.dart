library api;
import 'dart:html';
import 'dart:async';
import 'dart:convert';

final _AUTHORITY = 'api.giphy.com';
final _STICKER_SEARCH_PATH = '/v1/stickers/search';
final _BASE = 'https://api.giphy.com/v1/stickers/search';
final _API_KEY = 'dc6zaTOxFJmzC';

final _data = 'data';
final _id = 'id';
final _url = 'url';
final _images = 'images';
final _fixed_height = 'fixed_height';
final _api_key_param = 'api_key';
final _q_param = 'q';

class SearchResult {
  String id;
  String url;
  String imageUrl;

  SearchResult.fromJson(Map json) {
    id = json[_id];
    url = json[_url];
    imageUrl = json[_images][_fixed_height][_url];
  }
}

Future<List<SearchResult>> search(String q) async {
  var uri = new Uri.https(_AUTHORITY, _STICKER_SEARCH_PATH, {
    _api_key_param: _API_KEY,
    _q_param: q
  });
  var url = uri.toString();
  var rawData = await HttpRequest.getString(url);
  Map data = JSON.decode(rawData);
  List results = data[_data];
  return results.map((Map searchResultItemData) {
    return new SearchResult.fromJson(searchResultItemData);
  })
  .toList();
}
