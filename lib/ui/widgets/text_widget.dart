import 'package:flutter/material.dart';

import '../../domain/app_constants/app_constants.dart';

/// 📄 **[TextWidget]** - A customizable widget for displaying styled text with predefined text types.
class TextWidget extends StatelessWidget {
  final String? text;
  final TextType? textType;
  final Color? color;
  final TextAlign? alignment;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overflow;
  final int? maxLines;

  const TextWidget(
    this.text,
    this.textType, {
    super.key,
    this.color,
    this.alignment,
    this.fontWeight,
    this.fontSize,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    /// 🛠 **Helper method to build the text with applied styles.**
    Text buildText(TextStyle? baseStyle) {
      return Text(
        text ?? 'No name',
        textAlign: alignment ?? TextAlign.center,
        maxLines: maxLines,
        overflow: overflow,
        style: baseStyle?.copyWith(
          color: color ?? Theme.of(context).colorScheme.onSurface,
          fontWeight: fontWeight ?? baseStyle.fontWeight,
          fontSize: fontSize ?? baseStyle.fontSize,
        ),
      );
    }

    /// 🎯 **Determines the appropriate text style based on [TextType].**
    switch (textType) {
      case TextType.headline:
        return buildText(textTheme.headlineMedium);
      case TextType.smallHeadline:
        return buildText(textTheme.headlineSmall);
      case TextType.titleSmall:
        return buildText(textTheme.titleSmall);
      case TextType.titleMedium:
        return buildText(textTheme.titleMedium);
      case TextType.body:
        return buildText(textTheme.bodyMedium);
      case TextType.button:
        return buildText(textTheme.bodyLarge);
      case TextType.error:
        return buildText(
          textTheme.bodyLarge?.copyWith(color: AppConstants.errorColor),
        );
      default:
        return buildText(textTheme.bodyMedium);
    }
  }
}

/// 📑 **[TextType]** - Defines available styles for the [TextWidget].
enum TextType {
  headline,
  smallHeadline,
  titleSmall,
  titleMedium,
  body,
  button,
  error,
}
