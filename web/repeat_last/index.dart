library angular_default_header.main;

import 'dart:html';
import 'package:angular/angular.dart';
import 'dart:async';

@NgController(selector: '[somefruits]', publishAs: 'ctrl')
class Fruits {
  Fruits(){
    print('fruits created');
  }

  List fruits = ['Apple', 'Banana', 'Orange', 'Kiwi'];

  String dummy='';
  String foo(bool isLast) {
    print('foo: $isLast');
    new Future(() {
      //document.querySelector('.ng-last').style.border = '1px solid green';
    });
    return dummy;
  }
}


class MyAppModule extends Module {
  MyAppModule() {
    type(Fruits);
  }
}

void mutationCallback(List<MutationRecord> mutations, MutationObserver observer) {
  mutations.forEach((mr) {
    mr.addedNodes.forEach((Node n) {
      if(n is Element) {
        if(n.classes.contains('ng-last')) {
          print('last added');
          observer.disconnect();
          n.style.border = '1px solid red';
        }
      }
    });
  });
}

main() {
  print('main');
  var ul = document.querySelector('ul');
//  new MutationObserver(mutationCallback).observe(ul, childList: true);
  ngBootstrap(module: new MyAppModule());
}
