import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.readOnly = false,
    this.controller,
    this.required,
    this.onChanged,
    this.leftLabel,
    this.rightBtn,
    this.onBtnTap,
    this.rightWidget,
    this.inputType,
    this.inputFormatters,
    this.additionInfo = '',
    this.backgroundColor,
    this.textAlign,
    this.contentAlignment = TextAlign.start,
    this.maxLines = 1,
    this.validator,
    this.hintText,
    this.initialValue,
  });
  final TextEditingController? controller;
  final bool readOnly;
  final bool? required;
  final String? leftLabel;
  final Widget? rightBtn;
  final void Function()? onBtnTap;
  final void Function(String)? onChanged;
  final Widget? rightWidget;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? additionInfo;
  final Color? backgroundColor;
  final TextAlign? textAlign;
  final TextAlign contentAlignment;
  final int maxLines;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return CustomInput(
      initialValue: initialValue,
      leftLabel: leftLabel,
      contentAlignment: contentAlignment,
      leftLabelStyle: Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      hintText: hintText,
      hintTextStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Colors.black45),
      backgroundColor: backgroundColor,
      textAlign: textAlign,
      readOnly: readOnly,
      required: required,
      validator: validator,
      onChanged: onChanged,
      rightBtn: rightBtn,
      onBtnTap: onBtnTap,
      maxLines: maxLines,
      contentPadding: EdgeInsets.zero,
      needClear: false,
      rightWidget: rightWidget,
      inputType: inputType,
      inputFormatters: inputFormatters,
      additionInfo: additionInfo,
      cardStyle: TDCardStyle.errorStyle,
    );
  }
}

class CustomInput extends StatelessWidget {
  CustomInput(
      {super.key,
      this.width,
      double? height,
      this.textStyle,
      this.backgroundColor,
      this.decoration,
      this.leftIcon, // leftIcon is default designed 24 in size.
      this.leftLabel,
      this.leftLabelStyle,
      this.required,
      this.readOnly = false,
      this.autofocus = false,
      this.obscureText = false,
      this.onEditingComplete,
      this.onSubmitted,
      this.hintText,
      this.inputType,
      this.onChanged,
      this.inputFormatters,
      this.inputDecoration,
      this.maxLines = 1,
      this.focusNode,
      this.controller,
      this.cursorColor,
      this.rightBtn,
      this.hintTextStyle,
      this.onBtnTap,
      this.labelWidget,
      this.textInputBackgroundColor,
      this.contentPadding,
      this.type = TDInputType.normal,
      this.size = TDInputSize.large,
      double? leftInfoWidth,
      this.maxLength = 500,
      this.additionInfo = '',
      this.additionInfoColor,
      this.textAlign,
      this.onClearTap,
      this.needClear = true,
      this.clearBtnColor,
      this.contentAlignment = TextAlign.start,
      this.rightWidget,
      this.showBottomDivider = true,
      this.cardStyle,
      this.cardStyleTopText,
      this.cardStyleBottomText,
      this.validator,
      this.initialValue})
      : assert(() {
          if (type == TDInputType.cardStyle) {
            assert(width != null);
          }
          return true;
        }()),
        leftInfoWidth = leftInfoWidth ??
            ((leftLabel == null && leftIcon == null && !(required ?? false))
                ? 0
                : ((leftLabel?.length == null
                                ? 0
                                : (leftLabel!.length > 5
                                    ? 5.1
                                    : leftLabel.length)) *
                            16 +
                        1 +
                        (leftIcon != null ? 1 : 0) * 28) +
                    (required == true ? 1 : 0) * 14),
        height = 56;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Decoration? decoration;
  final String? leftLabel;
  final bool? required;
  final Widget? leftIcon;
  final Widget? labelWidget;
  final bool readOnly;
  final String? hintText;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final int maxLines;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool obscureText;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final InputDecoration? inputDecoration;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final String? cardStyleTopText;
  final String? cardStyleBottomText;
  final Color? textInputBackgroundColor;
  final Color? cursorColor;
  final Widget? rightBtn;
  final GestureTapCallback? onBtnTap;
  final GestureTapCallback? onClearTap;
  final bool needClear;
  final Color? clearBtnColor;
  final EdgeInsetsGeometry? contentPadding;
  final TDInputType type;
  final TDCardStyle? cardStyle;
  final TDInputSize size;
  final double? leftInfoWidth;
  final int? maxLength;
  final String? additionInfo;
  final Color? additionInfoColor;
  final TextAlign? textAlign;
  final Widget? rightWidget;
  final bool showBottomDivider;
  final TextAlign contentAlignment;
  final TextStyle? leftLabelStyle;
  final String? Function(String?)? validator;
  final String? initialValue;
  double getInputPadding() {
    switch (size) {
      case TDInputSize.small:
        return 12;
      case TDInputSize.large:
        return 16;
    }
  }

  Widget buildInputView(BuildContext context) {
    switch (type) {
      case TDInputType.normal:
        return buildNormalInput(context);
      case TDInputType.twoLine:
        return buildTwoLineInput(context);
      case TDInputType.special:
        return buildSpecialInput(context);
      case TDInputType.longText:
        return buildLongTextInput(context);
      case TDInputType.normalMaxTwoLine:
        return buildNormalInput(context);
      case TDInputType.cardStyle:
        return buildCardStyleInput(context);
    }
  }

  Widget buildNormalInput(BuildContext context) {
    var cardStyleDecoration = _getCardStylePreDecoration(context);
    var hasLeftWidget =
        leftLabel != null || leftIcon != null || (required ?? false);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          color: (cardStyleDecoration != null || decoration != null)
              ? null
              : backgroundColor,
          decoration: cardStyleDecoration ?? decoration,
          child: Row(
            crossAxisAlignment: additionInfo != ''
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: hasLeftWidget,
                child: const SizedBox(
                  width: 16,
                ),
              ),
              SizedBox(
                width: leftInfoWidth,
                child: Row(
                  children: [
                    Visibility(
                      visible: leftIcon != null,
                      child: leftIcon ?? const SizedBox.shrink(),
                    ),
                    Visibility(
                      visible: leftLabel != null,
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 81),
                        padding: EdgeInsets.only(
                            left: leftIcon != null ? 4 : 0,
                            top: getInputPadding(),
                            bottom: getInputPadding()),
                        child: Column(
                          children: [
                            TDText(
                              leftLabel,
                              maxLines: 2,
                              style: leftLabelStyle,
                              font: TDTheme.of(context).fontBodyLarge,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: labelWidget != null,
                      child: labelWidget ?? const SizedBox.shrink(),
                    ),
                    Visibility(
                        visible: required ?? false,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: TDText(
                            '*',
                            maxLines: 1,
                            style: TextStyle(
                                color: TDTheme.of(context).errorColor6),
                            font: TDTheme.of(context).fontBodyLarge,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TDInputView(
                      textStyle: textStyle ??
                          TextStyle(color: TDTheme.of(context).fontGyColor1),
                      readOnly: readOnly,
                      autofocus: autofocus,
                      obscureText: obscureText,
                      onEditingComplete: onEditingComplete,
                      onSubmitted: onSubmitted,
                      hintText: hintText,
                      inputType: inputType,
                      onChanged: onChanged,
                      inputFormatters: inputFormatters,
                      inputDecoration: inputDecoration,
                      maxLines: maxLines,
                      maxLength: maxLength,
                      focusNode: focusNode,
                      isCollapsed: true,
                      textAlign: contentAlignment,
                      hintTextStyle: hintTextStyle ??
                          TextStyle(color: TDTheme.of(context).fontGyColor3),
                      cursorColor: cursorColor,
                      textInputBackgroundColor: textInputBackgroundColor,
                      controller: controller,
                      contentPadding: contentPadding ??
                          EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom:
                                  additionInfo != '' ? 4 : getInputPadding(),
                              top: getInputPadding()),
                    ),
                    Visibility(
                      visible: additionInfo != '',
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16, bottom: getInputPadding()),
                        child: TDText(
                          additionInfo,
                          font: TDTheme.of(context).fontBodySmall,
                          textColor: additionInfoColor ??
                              TDTheme.of(context).fontGyColor3,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: controller != null &&
                    controller!.text.isNotEmpty &&
                    needClear,
                replacement: Visibility(
                  visible: rightBtn != null,
                  child: GestureDetector(
                    onTap: onBtnTap,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 17.5,
                          right: 16,
                          top: additionInfo != '' ? getInputPadding() : 0),
                      child: rightBtn,
                    ),
                  ),
                ),
                child: GestureDetector(
                    onTap: onClearTap ??
                        () {
                          controller?.text = '';
                        },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 17.5,
                          right: 16,
                          top: additionInfo != '' ? getInputPadding() : 0),
                      child: Icon(
                        TDIcons.close_circle_filled,
                        color:
                            clearBtnColor ?? TDTheme.of(context).fontGyColor3,
                      ),
                    )),
              ),
            ],
          ),
        ),
        Visibility(
          visible: type != TDInputType.cardStyle,
          child: const TDDivider(
            margin: EdgeInsets.only(
              left: 16,
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration? _getCardStylePreDecoration(BuildContext context) {
    BoxDecoration? cardStyleDecoration;
    if (type == TDInputType.cardStyle) {
      switch (cardStyle) {
        case TDCardStyle.topText:
          cardStyleDecoration = BoxDecoration(
              color: Colors.white,
              border: Border.all(color: TDTheme.of(context).grayColor4),
              borderRadius: BorderRadius.circular(6));
          break;
        case TDCardStyle.topTextWithBlueBorder:
          cardStyleDecoration = BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: TDTheme.of(context).brandNormalColor, width: 1.5),
              borderRadius: BorderRadius.circular(6));
          break;
        case TDCardStyle.errorStyle:
          cardStyleDecoration = BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: TDTheme.of(context).errorColor6, width: 1.5),
              borderRadius: BorderRadius.circular(6));
          break;
        default:
          cardStyleDecoration = BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6));
          break;
      }
    }
    return cardStyleDecoration;
  }

  Widget buildTwoLineInput(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: decoration != null ? null : backgroundColor,
      decoration: decoration,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: leftLabel != null,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 12),
                  child: leftInfoWidth != null
                      ? SizedBox(
                          width: leftInfoWidth,
                          child: TDText(
                            leftLabel,
                            maxLines: 1,
                            style: leftLabelStyle,
                            font: TDTheme.of(context).fontBodyMedium,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : TDText(
                          leftLabel,
                          maxLines: 1,
                          font: TDTheme.of(context).fontBodyMedium,
                          fontWeight: FontWeight.w400,
                        ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 12, top: 7),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Visibility(
                      visible: labelWidget != null,
                      child: labelWidget ?? const SizedBox.shrink(),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomInputView(
                        initialValue: initialValue,
                        textStyle: textStyle ??
                            TextStyle(color: TDTheme.of(context).fontGyColor1),
                        readOnly: readOnly,
                        autofocus: autofocus,
                        validator: validator,
                        obscureText: obscureText,
                        onEditingComplete: onEditingComplete,
                        onSubmitted: onSubmitted,
                        hintText: hintText,
                        inputType: inputType,
                        onChanged: onChanged,
                        textAlign: textAlign,
                        inputFormatters: inputFormatters,
                        inputDecoration: inputDecoration,
                        isCollapsed: true,
                        maxLines: maxLines,
                        focusNode: focusNode,
                        hintTextStyle: hintTextStyle ??
                            TextStyle(color: TDTheme.of(context).fontGyColor3),
                        cursorColor: cursorColor,
                        textInputBackgroundColor: textInputBackgroundColor,
                        controller: controller,
                        contentPadding: contentPadding ??
                            const EdgeInsets.only(left: 16, right: 16),
                      ),
                    ),
                    Visibility(
                      visible: controller != null &&
                          controller!.text.isNotEmpty &&
                          needClear,
                      replacement: Visibility(
                        visible: rightBtn != null,
                        child: GestureDetector(
                          onTap: onBtnTap,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 17.5, right: 16),
                            child: rightBtn,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: onClearTap,
                        child: Container(
                          margin: const EdgeInsets.only(left: 17.5, right: 16),
                          child: Icon(
                            TDIcons.close_circle_filled,
                            color: clearBtnColor ??
                                TDTheme.of(context).fontGyColor3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Visibility(
            child: TDDivider(
              margin: EdgeInsets.only(
                left: 16,
              ),
            ),
          ),
          Visibility(
            visible: showBottomDivider,
            child: const TDDivider(
              margin: EdgeInsets.only(
                left: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLongTextInput(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: decoration != null ? null : backgroundColor,
      decoration: decoration,
      height: leftLabel != null ? 197 : 148,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: leftLabel != null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: 16,
                        top: getInputPadding(),
                        bottom: getInputPadding()),
                    child: TDText(
                      leftLabel,
                      maxLines: 2,
                      fontWeight: FontWeight.w400,
                    )),
                const TDDivider(
                  margin: EdgeInsets.only(
                    left: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomInputView(
              initialValue: initialValue,
              textStyle: textStyle ??
                  TextStyle(color: TDTheme.of(context).fontGyColor1),
              readOnly: readOnly,
              autofocus: autofocus,
              validator: validator,
              obscureText: obscureText,
              onEditingComplete: onEditingComplete,
              onSubmitted: onSubmitted,
              hintText: hintText,
              inputType: inputType,
              textAlign: textAlign,
              onChanged: onChanged,
              inputFormatters: inputFormatters ??
                  [LengthLimitingTextInputFormatter(maxLength)],
              inputDecoration: inputDecoration,
              maxLines: maxLines,
              focusNode: focusNode,
              hintTextStyle: hintTextStyle ??
                  TextStyle(color: TDTheme.of(context).fontGyColor3),
              cursorColor: cursorColor,
              textInputBackgroundColor: textInputBackgroundColor,
              controller: controller,
              contentPadding: contentPadding ??
                  const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 12),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: TDText(
              '${controller?.text.length}/$maxLength',
              font: TDTheme.of(context).fontBodySmall,
              textColor: TDTheme.of(context).fontGyColor3,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpecialInput(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          color: decoration != null ? null : backgroundColor,
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Visibility(
                visible: leftLabel != null,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16,
                      top: getInputPadding(),
                      bottom: getInputPadding()),
                  child: leftInfoWidth != null
                      ? SizedBox(
                          width: leftInfoWidth,
                          child: TDText(
                            leftLabel,
                            maxLines: 1,
                            font: TDTheme.of(context).fontBodyLarge,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : TDText(
                          leftLabel,
                          maxLines: 1,
                          font: TDTheme.of(context).fontBodyLarge,
                          fontWeight: FontWeight.w400,
                        ),
                ),
              ),
              Visibility(
                visible: labelWidget != null,
                child: labelWidget ?? const SizedBox.shrink(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CustomInputView(
                    initialValue: initialValue,
                    textStyle: textStyle ??
                        TextStyle(color: TDTheme.of(context).fontGyColor1),
                    readOnly: readOnly,
                    validator: validator,
                    autofocus: autofocus,
                    obscureText: obscureText,
                    onEditingComplete: onEditingComplete,
                    onSubmitted: onSubmitted,
                    hintText: hintText,
                    inputType: inputType,
                    onChanged: onChanged,
                    inputFormatters: inputFormatters,
                    inputDecoration: inputDecoration,
                    maxLines: maxLines,
                    focusNode: focusNode,
                    isCollapsed: true,
                    hintTextStyle: hintTextStyle ??
                        TextStyle(color: TDTheme.of(context).fontGyColor3),
                    cursorColor: cursorColor,
                    textInputBackgroundColor: textInputBackgroundColor,
                    controller: controller,
                    textAlign: textAlign,
                    contentPadding: contentPadding ??
                        EdgeInsets.only(
                            right: 8,
                            bottom: getInputPadding(),
                            top: getInputPadding()),
                  ),
                ),
              ),
              Visibility(
                visible: rightWidget != null,
                child: Container(
                  margin: EdgeInsets.only(
                      top: getInputPadding(),
                      bottom: getInputPadding(),
                      right: 16),
                  child: rightWidget,
                ),
              ),
            ],
          ),
        ),
        const Visibility(
          child: TDDivider(
            margin: EdgeInsets.only(
              left: 16,
            ),
          ),
        ),
      ],
    );
  }

  Size getTextSize(String text, [TextStyle? style]) {
    var painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
      ellipsis: '...',
    );
    painter.layout();
    return painter.size;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width ?? screenWidth,
      child: buildInputView(context),
    );
  }

  Widget buildCardStyleInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: cardStyleTopText != null,
          child: Column(
            children: [
              Text(
                cardStyleTopText ?? '',
                style: TextStyle(
                    fontSize: TDTheme.of(context).fontBodySmall!.size,
                    height: TDTheme.of(context).fontBodySmall!.height),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        buildNormalInput(context),
        Visibility(
          visible: cardStyleBottomText != null,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                cardStyleBottomText ?? '',
                style: TextStyle(
                    color: TDTheme.of(context).errorColor6,
                    fontSize: TDTheme.of(context).fontBodySmall!.size,
                    height: TDTheme.of(context).fontBodySmall!.height),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomInputView extends StatelessWidget {
  final bool readOnly;
  final String? hintText;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool obscureText;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final InputDecoration? inputDecoration;
  final TextStyle textStyle;
  final TextStyle? hintTextStyle;
  final Color? textInputBackgroundColor;
  final Color? cursorColor;
  final EdgeInsetsGeometry contentPadding;
  final bool isCollapsed;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final String? initialValue;
  const CustomInputView(
      {super.key,
      required this.textStyle,
      this.readOnly = false,
      this.autofocus = false,
      this.obscureText = false,
      this.onEditingComplete,
      this.onSubmitted,
      this.hintText = '',
      this.inputType,
      this.onChanged,
      this.inputFormatters,
      this.inputDecoration,
      this.maxLines,
      this.maxLength,
      this.focusNode,
      this.hintTextStyle,
      this.cursorColor,
      this.textInputBackgroundColor,
      this.contentPadding = EdgeInsets.zero,
      this.isCollapsed = false,
      this.textAlign,
      this.controller,
      this.validator,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      keyboardType: inputType,
      autofocus: autofocus,
      validator: validator,
      obscureText: obscureText,
      onEditingComplete: onEditingComplete,
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      cursorColor: cursorColor,
      maxLines: maxLines,
      maxLength: maxLength,
      style: textStyle,
      textAlign: textAlign ?? TextAlign.start,
      buildCounter: _buildCounter,
      decoration: inputDecoration ??
          InputDecoration(
            hintText: hintText,
            hintStyle: hintTextStyle ?? textStyle,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: textInputBackgroundColor != null,
            fillColor: textInputBackgroundColor,
            contentPadding: contentPadding,
            isCollapsed: isCollapsed,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
    );
  }

  Widget? _buildCounter(BuildContext context,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength}) {
    return null;
  }
}
