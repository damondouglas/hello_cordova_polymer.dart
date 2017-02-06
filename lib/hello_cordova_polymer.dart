library hello_cordova_polymer;

@HtmlImport('hello_cordova_polymer.html')
import 'dart:html';
import 'dart:async';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'search.dart';
import 'list.dart';
import 'progress.dart';
import 'placeholder.dart';
import 'api.dart' as api;
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_flex_layout_classes.dart';

final progressTimerDuration = new Duration(milliseconds: 500);
final searchTimerDuration = new Duration(milliseconds: 1500);

@PolymerRegister('hello-cordova')
class HelloCordova extends PolymerElement {
  XProgress progress;
  XSearch search;
  XPlaceholder placeholder;
  XList list;
  HelloCordova.created() : super.created();
  Timer progressTimer;
  Timer searchTimer;

  attached() {
    search = $['search'];
    progress = $['progress'];
    list = $['list'];
    placeholder = $['placeholder'];

    search.onSearchChanged.listen((CustomEvent searchChangeEvent) {
      progress.active = false;
      if (progressTimer != null) progressTimer.cancel();
      if (searchTimer != null) searchTimer.cancel();
      if (search.value != null && search.value.isNotEmpty) {
        progressTimer = new Timer(progressTimerDuration, progressTimeElapsed);
        searchTimer = new Timer(searchTimerDuration, searchTimeElapsed);
      } else {
        list.data = [];
        placeholder.rotateUrl();
        placeholder.active = true;
      }
    });
  }

  progressTimeElapsed() {
    progress.active = true;
    placeholder.active = false;
  }

  searchTimeElapsed() {
    var q = search.value;
    if (q != null && q.isNotEmpty) {
      api.search(q).then((List<api.SearchResult> results) {
        progress.active = false;
        list.data = results;
      });
    } else progress.active = false;
  }
}
