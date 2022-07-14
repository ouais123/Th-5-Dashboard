import 'package:flutter/material.dart';

class AdaptableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final double minimumFontScale;
  final TextOverflow textOverflow;
  final int? maxLine;
  const AdaptableText(this.text,
      {this.style,
      this.textAlign = TextAlign.start,
      this.textDirection = TextDirection.ltr,
      this.minimumFontScale = 0.5,
      this.maxLine,
      this.textOverflow = TextOverflow.ellipsis,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextPainter _painter = TextPainter(
        text: TextSpan(text: text, style: style),
        textAlign: textAlign,
        textScaleFactor: 1,
        maxLines: maxLine ?? 100,
        textDirection: textDirection);

    return LayoutBuilder(
      builder: (context, constraints) {
        _painter.layout(maxWidth: constraints.maxWidth);
        double textScaleFactor = 1;

        if (_painter.height > constraints.maxHeight) {
          _painter.textScaleFactor = minimumFontScale;
          _painter.layout(maxWidth: constraints.maxWidth);

          if (_painter.height > constraints.maxHeight) {
            textScaleFactor = minimumFontScale;
          } else if (minimumFontScale < 1) {
            int h = 100;
            int l = (minimumFontScale * 100).toInt();
            while (h > l) {
              int mid = (l + (h - l) / 2).toInt();
              double newScale = mid.toDouble() / 100.0;
              _painter.textScaleFactor = newScale;
              _painter.layout(maxWidth: constraints.maxWidth);

              if (_painter.height > constraints.maxHeight) {
                //
                h = mid - 1;
              } else {
                l = mid + 1;
              }
              if (h <= l) {
                textScaleFactor = newScale - 0.01;
                _painter.textScaleFactor = newScale;
                _painter.layout(maxWidth: constraints.maxWidth);
                break;
              }
            }
          }
        }

        return Text(
          text,
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          maxLines: maxLine ?? 100,
          overflow: textOverflow,
        );
      },
    );
  }
}
