// import 'package:flutter/material.dart';
// import 'package:ez_joyreactor_app/ui/ui.dart';
// import 'package:ez_joyreactor_app/core/core.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class NodeContent extends StatefulWidget {
//   const NodeContent(
//       {super.key,
//       required this.nodeText,
//       required this.nodeAttributes,
//       required this.nodeType});
//   final String nodeText;
//   final List<Attribute>? nodeAttributes;
//   final String nodeType;
//
//   @override
//   State<NodeContent> createState() => _NodeContentState();
// }
//
// class _NodeContentState extends State<NodeContent> {
//   WebViewController controller = WebViewController();
//
//   @override
//   void initState() {
//     String generateCarouselItems() {
//       List<String> carouselItems = [];
//       String currentItem = '';
//       if (widget.nodeAttributes != null) {
//         for (int i = 0; i < widget.nodeAttributes!.length; i++) {
//           switch (widget.nodeAttributes?[i].attributeType) {
//             case 'PICTURE':
//               currentItem = '''
//               <img src="https://img2.joyreactor.cc/pics/${widget.nodeType}/picture-${widget.nodeAttributes?[i].attributePictureId}.jpeg" alt="Image" />
//             ''';
//               break;
//             case 'YOUTUBE':
//               currentItem = '''
//               <iframe id="ytplayer" width="640" height="360"
//               src="http://www.youtube.com/embed/${widget.nodeAttributes?[i].attributeEmbedValue}&
//               origin=http://joyreactor.cc"/></iframe>
//             ''';
//               break;
//             case 'COUB':
//               currentItem = '''
//               <iframe src="//coub.com/embed/${widget.nodeAttributes?[i].attributeEmbedValue}?
//               muted=false&autostart=false&originalSize=false&startWithHD=false"
//               allowfullscreen width="640" height="270" allow="autoplay"></iframe>
//             ''';
//               break;
//             case 'VIMEO':
//               currentItem = '''
//               <iframe src="https://player.vimeo.com/video/${widget.nodeAttributes?[i].attributeEmbedValue}"
//                width="640" height="360" allow="autoplay;
//               fullscreen; picture-in-picture" allowfullscreen></iframe>
//             ''';
//               break;
//             case 'WEBM':
//               currentItem = '''<video controls>
//               <source src="https://img2.joyreactor.cc/pics/${widget.nodeType}/webm/video-${widget.nodeAttributes?[i].attributePictureId}.webm" type="video/webm">
//               Your browser does not support the video tag.</video>
//             ''';
//               break;
//             default:
//               currentItem = ''; // Handle default case if needed
//           }
//
//           carouselItems.add('''
//           <li id="carousel__slide${i + 1}" tabindex="0" class="carousel__slide">
//             <div class="carousel__snapper"></div>
//             $currentItem
//           </li>
//         ''');
//         }
//       }
//       return carouselItems.join('');
//     }
//
//     String nodeContent = '''
//       <!DOCTYPE html>
//       <html lang="ru">
//       <head>
//         <title>Node content</title>
//         <style>
//           $carouselCss
//         </style>
//       </head>
//       <body>
//         <h1>CSS-only Carousel</h1>
//         <section class="carousel" aria-label="Gallery">
//           <ol class="carousel__viewport">
//             ${generateCarouselItems()}
//           </ol>
//         </section>
//       </body>
//       </html>
//     ''';
//
//     controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(Colors.transparent)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             debugPrint('page loading on $progress percent');
//           },
//           onPageStarted: (String url) {
//             debugPrint('page loading $url started');
//           },
//           onPageFinished: (String url) {
//             debugPrint('page loading $url finished');
//           },
//           onWebResourceError: (WebResourceError error) {
//             debugPrint(
//                 'Android Web Resource Error: ${error.errorCode} - ${error.description}');
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             return NavigationDecision.prevent;
//           },
//         ),
//       )
//       ..loadHtmlString(nodeContent);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // controller.clearCache();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(child: WebViewWidget(controller: controller));
//   }
// }

import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/ui/ui.dart';
import 'package:ez_joyreactor_app/core/core.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_html/flutter_html.dart';

class NodeContent extends StatefulWidget {
  const NodeContent({
    Key? key,
    required this.nodeText,
    required this.nodeAttributes,
    required this.nodeType,
  }) : super(key: key);

  final String nodeText;
  final List<Attribute>? nodeAttributes;
  final String nodeType;

  @override
  State<NodeContent> createState() => _NodeContentState();
}

class _NodeContentState extends State<NodeContent> {
  String _processedNodeText = '';

  @override
  void initState() {
    super.initState();

    _processNodeText();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _processNodeText() async {
    replacer(Match match) {
      int attributeNumber = int.parse(match.group(1)!);
      Attribute attribute = widget.nodeAttributes![attributeNumber - 1];

      String currentItem;
      switch (attribute.attributeType) {
        case 'PICTURE':
          currentItem = '''
          <img src="https://img2.joyreactor.cc/pics/${widget.nodeType}/picture-${attribute.attributePictureId}.jpeg" alt="Image" />
        ''';
          break;
        case 'YOUTUBE':
          currentItem = '''
          <iframe id="ytplayer" width="640" height="360"
          src="http://www.youtube.com/embed/${attribute.attributeEmbedValue}&
          origin=http://joyreactor.cc"/></iframe>
        ''';
          break;
        case 'COUB':
          currentItem = '''
              <iframe src="//coub.com/embed/${attribute.attributeEmbedValue}?
              muted=false&autostart=false&originalSize=false&startWithHD=false"
              allowfullscreen width="640" height="270" allow="autoplay"></iframe>
            ''';
          break;
        case 'VIMEO':
          currentItem = '''
              <iframe src="https://player.vimeo.com/video/${attribute.attributeEmbedValue}"
               width="640" height="360" allow="autoplay;
              fullscreen; picture-in-picture" allowfullscreen></iframe>
            ''';
          break;
        case 'WEBM':
          currentItem = '''<video controls>
              <source src="https://img2.joyreactor.cc/pics/${widget.nodeType}/webm/video-${attribute.attributePictureId}.webm" type="video/webm">
              Your browser does not support the video tag.</video>
            ''';
          break;
        default:
          currentItem = ''; // Handle default case if needed
      }

      return currentItem;
    }

    _processedNodeText = widget.nodeText.replaceAllMapped(
      RegExp(r'&attribute_insert_(\d+)&'),
      replacer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _processNodeText(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Html(
            data: _processedNodeText,
          );
        }
      },
    );
  }
}
