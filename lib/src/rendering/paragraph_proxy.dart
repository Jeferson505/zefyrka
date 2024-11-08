import 'package:flutter/rendering.dart';

import 'editable_box.dart';

/// Proxy to built-in [RenderParagraph] so that it can be used inside Zefyr
/// editor.
class RenderParagraphProxy extends RenderProxyBox
    implements RenderContentProxyBox {
  RenderParagraphProxy({
    RenderParagraph? child,
    required TextStyle? textStyle,
    required TextAlign textAlign,
    required TextDirection? textDirection,
    required double textScaleFactor,
    required StrutStyle strutStyle,
    required Locale locale,
    required TextWidthBasis textWidthBasis,
    required TextHeightBehavior? textHeightBehavior,
  })  : _prototypePainter = TextPainter(
            text: TextSpan(text: ' ', style: textStyle),
            textAlign: textAlign,
            textDirection: textDirection,
            textScaler: TextScaler.linear(textScaleFactor),
            strutStyle: strutStyle,
            locale: locale,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior),
        super(child);

  final TextPainter _prototypePainter;

  set textStyle(TextStyle value) {
    if (_prototypePainter.text!.style == value) return;
    _prototypePainter.text = TextSpan(text: ' ', style: value);
    markNeedsLayout();
  }

  set textAlign(TextAlign value) {
    if (_prototypePainter.textAlign == value) return;
    _prototypePainter.textAlign = value;
    markNeedsLayout();
  }

  set textDirection(TextDirection value) {
    if (_prototypePainter.textDirection == value) return;
    _prototypePainter.textDirection = value;
    markNeedsLayout();
  }

  set textScaleFactor(double value) {
    if (_prototypePainter.textScaler == TextScaler.linear(value)) return;
    _prototypePainter.textScaler = TextScaler.linear(value);
    markNeedsLayout();
  }

  set strutStyle(StrutStyle value) {
    if (_prototypePainter.strutStyle == value) return;
    _prototypePainter.strutStyle = value;
    markNeedsLayout();
  }

  set locale(Locale value) {
    if (_prototypePainter.locale == value) return;
    _prototypePainter.locale = value;
    markNeedsLayout();
  }

  set textWidthBasis(TextWidthBasis value) {
    if (_prototypePainter.textWidthBasis == value) return;
    _prototypePainter.textWidthBasis = value;
    markNeedsLayout();
  }

  set textHeightBehavior(TextHeightBehavior? value) {
    if (_prototypePainter.textHeightBehavior == value) return;
    _prototypePainter.textHeightBehavior = value;
    markNeedsLayout();
  }

  @override
  RenderParagraph? get child => super.child as RenderParagraph?;

  @override
  double get preferredLineHeight => _prototypePainter.preferredLineHeight;

  @override
  Offset getOffsetForCaret(TextPosition position, Rect caretPrototype) {
    return child!.getOffsetForCaret(position, caretPrototype);
  }

  @override
  TextPosition getPositionForOffset(Offset offset) {
    return child!.getPositionForOffset(offset);
  }

  @override
  double? getFullHeightForCaret(TextPosition position) {
    return child!.getFullHeightForCaret(position);
  }

  @override
  TextRange getWordBoundary(TextPosition position) {
    return child!.getWordBoundary(position);
  }

  @override
  List<TextBox> getBoxesForSelection(TextSelection selection) {
    return child!.getBoxesForSelection(selection);
  }

  @override
  void performLayout() {
    super.performLayout();
    _prototypePainter.layout(
        minWidth: constraints.minWidth, maxWidth: constraints.maxWidth);
  }
}
