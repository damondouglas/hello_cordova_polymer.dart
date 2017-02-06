library progress;

@HtmlImport('progress.html')
import 'dart:html';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/paper_spinner.dart';

@PolymerRegister('x-progress')
class XProgress extends PolymerElement {
  PaperSpinner progress;
  XProgress.created() : super.created();

  attached() {
    progress = $['progress'];
  }

  set active(bool _active) => progress.active = _active;
}
