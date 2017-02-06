@HtmlImport('my_element.html')
library my_element;

import 'dart:html';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:hello_cordova_polymer/hello_cordova_polymer.dart';

@PolymerRegister('my-element')
class MyElement extends PolymerElement {
  MyElement.created() : super.created();
  ready() {

  }
}
