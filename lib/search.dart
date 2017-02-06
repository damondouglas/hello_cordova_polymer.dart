library search;

@HtmlImport('search.html')
import 'dart:html';
import 'dart:async';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_button.dart';

final SEARCH_CHANGED = 'SEARCH_CHANGED';

@PolymerRegister('x-search')
class XSearch extends PolymerElement {
  XSearch.created() : super.created();
  var _searchChangedController = new StreamController();
  PaperInput _search;

  attached() {
    _search = $['search'];
  }

  String get value => _search.value;

  @reflectable
  onSearchChange([_,__]) {
    var value = _search.value;
    _searchChangedController.add(new CustomEvent(SEARCH_CHANGED, detail: value));
  }

  Stream get onSearchChanged => _searchChangedController.stream;

  @reflectable
  clearClicked([_,__]) {
    _search.value = "";
    _searchChangedController.add(new CustomEvent(SEARCH_CHANGED, detail: value));
    _search.focus();
  }
}
