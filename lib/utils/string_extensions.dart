import 'package:flutter/widgets.dart';

extension StringExtensions on String {
  double heightForConstraints(
      BuildContext context, TextStyle style, BoxConstraints constraints) {
    var richText = Text.rich(TextSpan(text: this),
            textAlign: TextAlign.center, style: style)
        .build(context) as RichText;

    var renderObject = richText.createRenderObject(context);
    renderObject.layout(constraints);

    var lastBox = renderObject
        .getBoxesForSelection(
            TextSelection(baseOffset: 0, extentOffset: this.length))
        .last;

    return lastBox.bottom;
  }

  Color toColor() {
    var hash = 0;

    for (var i = 0; i < this.length; i++) {
      hash = this.codeUnitAt(i) + ((hash << 5) - hash);
    }

    var color = '';

    for (var i = 0; i < 3; i++) {
      var value = (hash >> (i * 8)) & 0xFF;
      color += ('00' + value.toString());
    }

    return Color(int.parse(color));
  }
}
