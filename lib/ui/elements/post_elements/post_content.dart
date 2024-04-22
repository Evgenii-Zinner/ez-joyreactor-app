import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/core/core.dart';
import 'package:ez_joyreactor_app/ui/ui.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
    required this.text,
    required this.attributes,
  });

  final String text;
  final List<Attribute>? attributes;

  @override
  Widget build(BuildContext context) {
    return NodeContent(
      nodeText: text,
      nodeAttributes: attributes,
      nodeType: 'post',
    );
  }
}
