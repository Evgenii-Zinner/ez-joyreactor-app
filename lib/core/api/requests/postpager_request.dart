import 'dart:convert';

String postPagerRequest(String type, int offset) {
  return '''
  {"query":"query {
    tag {
      postPager(type: $type) {
        posts(offset: $offset) {
          id
          }
        }
      }
    }","variables":{}}
  '''.replaceAll('\n', '');
}
