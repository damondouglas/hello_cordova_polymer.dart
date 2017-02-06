library list;

@HtmlImport('list.html')
import 'dart:html';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'api.dart' as api;
import 'package:polymer_elements/paper_card.dart';
import 'package:polymer_elements/paper_fab.dart';
import 'package:polymer_elements/social_icons.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_flex_layout_classes.dart';

@PolymerRegister('x-list')
class XList extends PolymerElement {
  XList.created() : super.created();
  List<ResultItem> results = [];
  attached() {

  }

  set data(List<api.SearchResult> results) {
    set(
      'results',
      results.map((api.SearchResult result) {
        var item = new ResultItem();
        item
        ..id = result.id
        ..url = result.url
        ..imageUrl = result.imageUrl;
        return item;
      }).toList()
    );
  }

}

class ResultItem extends JsProxy {
  @reflectable String id;
  @reflectable String url;
  @reflectable String imageUrl;
}
