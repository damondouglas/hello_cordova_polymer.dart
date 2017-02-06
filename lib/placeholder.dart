library placeholder;

@HtmlImport('placeholder.html')
import 'dart:html';
import 'dart:math';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_flex_layout_classes.dart';

final imageUrls = [
  '3oEjHCCOoYdjv8M6iI.gif',
  '3oEjHHQaxwsmuiB5hm.gif',
  '3oEjHIK8bj1JnzB5NC.gif',
  '3oEjHOyNwE2iz1z6bC.gif',
  '3oEjHRFm4DK8T68upW.gif',
  '3oEjI0Jort6dqkW7Ty.gif',
  '3oEjI1f0fykCIyBbR6.gif',
  '3oEjI4PRkwjFqnd7CE.gif',
  'l41YBaRJbDELMSj7i.gif',
  'l41YcyioPFUXejz0c.gif',
  'l41Yfcar0BR9ZNHTq.gif',
  'l41YlHs99JsSptZf2.gif',
  'l41Ynne9kEdyLbvos.gif',
  'l41YwqAb0xfTbFss0.gif',
  'l41YxdIcDU58r5CDK.gif',
];

final BASE = 'images/';
final HIDE = 'hide';

@PolymerRegister('x-placeholder')
class XPlaceholder extends PolymerElement { 
  XPlaceholder.created() : super.created();
  DivElement container;
  DivElement blinds;
  ImageElement placeholder;

  attached() {
    container = this.querySelector('.container');
    blinds = $['blinds'];
    placeholder = $['placeholder'];
    rotateUrl();

  }

  String getRandomUrl() {
    var random = new Random();
    var index = random.nextInt(imageUrls.length - 1);
    return BASE + imageUrls[index];
  }

  rotateUrl() => placeholder.src = getRandomUrl();

  set active(bool _active) {
    if(_active) {
      blinds.classes.remove(HIDE);
    } else {
      blinds.classes.add(HIDE);
    }
  }
}
