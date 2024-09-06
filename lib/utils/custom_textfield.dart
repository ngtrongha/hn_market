import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:input_quantity/input_quantity.dart';
import 'calendar_datetime_picker.dart';
import 'empty_widget.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.readOnly = false,
      this.isPickDate = false,
      this.controller,
      this.required = false,
      this.onChanged,
      this.onTap,
      this.inputType,
      this.inputFormatters,
      this.textAlign,
      this.contentAlignment = TextAlign.start,
      this.validator,
      this.hintText,
      this.initialValue,
      this.suffixIcon,
      this.prefixIcon,
      this.title,
      this.suffixIconMaxWidth = 40,
      this.maxLines = 1,
      this.minLines = 1,
      this.obscureText = false,
      this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
      this.autovalidateMode,
      this.onFieldSubmitted,
      this.enabled,
      this.focusNode,
      this.textInputAction});
  final String? title;
  final TextEditingController? controller;
  final bool readOnly;
  final bool isPickDate;
  final bool required;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final TextAlign contentAlignment;
  final String? Function(String? value)? validator;
  final String? hintText;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BorderRadius borderRadius;
  final double suffixIconMaxWidth;
  final int? maxLines;
  final int minLines;
  final bool obscureText;
  final AutovalidateMode? autovalidateMode;
  final bool? enabled;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          if (required)
            title!.requiredText(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary)
          else
            title!.size14.w700.color(Theme.of(context).colorScheme.primary),
        if (title != null) 8.sized,
        Material(
          borderRadius: borderRadius,
          color:
              (enabled ?? true) || isPickDate ? Colors.white : '#EBEAEA'.color,
          child: TextFormField(
            initialValue: initialValue,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            keyboardType: inputType,
            validator: validator,
            controller: controller,
            enabled: enabled,
            textInputAction: textInputAction,
            onChanged: onChanged,
            maxLines: maxLines,
            minLines: minLines,
            focusNode: focusNode,
            onTap: onTap,
            onFieldSubmitted: onFieldSubmitted,
            autovalidateMode:
                autovalidateMode ?? AutovalidateMode.onUserInteraction,
            obscureText: obscureText,
            textAlign: textAlign ?? TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
                color: '#082819'.color),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: '#BABABA'.color),
              suffixIconConstraints:
                  BoxConstraints(maxWidth: suffixIconMaxWidth),
              suffixIcon: suffixIcon,
              prefixIconConstraints: const BoxConstraints(maxWidth: 40),
              prefixIcon: prefixIcon,
              contentPadding:
                  EdgeInsets.only(left: 10, top: minLines > 1 ? 10 : 0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              errorStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.error),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    this.required = false,
    this.onChanged,
    this.onTap,
    this.rightWidget,
    this.contentAlignment = TextAlign.start,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.title,
    this.suffixIconMaxWidth = 40,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.autovalidateMode,
    this.focusNode,
    required this.items,
    this.value,
  });
  final List<DropdownMenuItem<T>>? items;
  final String? title;
  final bool required;
  final void Function()? onTap;
  final void Function(T?)? onChanged;
  final Widget? rightWidget;
  final TextAlign contentAlignment;
  final String? Function(T?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BorderRadius borderRadius;
  final double suffixIconMaxWidth;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final T? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          if (required)
            title!.requiredText(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary)
          else
            title!.size14.w700.color(Theme.of(context).colorScheme.primary),
        if (title != null) 8.sized,
        DropdownButtonFormField<T>(
          items: items,
          value: value,
          validator: validator,
          onChanged: onChanged,
          focusNode: focusNode,
          onTap: onTap,
          padding: EdgeInsets.zero,
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
              color: '#082819'.color),
          menuMaxHeight: 250,
          icon: Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Theme.of(context).colorScheme.outline))),
              child: const Icon(Icons.keyboard_arrow_down_rounded)),
          iconEnabledColor: Theme.of(context).colorScheme.primary,
          iconDisabledColor: Theme.of(context).colorScheme.outline,
          alignment: Alignment.centerLeft,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: '#BABABA'.color),
            suffixIconConstraints: BoxConstraints(maxWidth: suffixIconMaxWidth),
            suffixIcon: suffixIcon,
            prefixIconConstraints: const BoxConstraints(maxWidth: 40),
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.only(left: 10),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
            errorStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.error),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}

class TimePickerTextField extends StatelessWidget {
  const TimePickerTextField({
    super.key,
    required this.title,
    this.initialTime,
    required this.onChange,
    this.enabled = true,
    this.required = true,
    this.validator,
  });
  final String title;
  final String? initialTime;
  final void Function(DateTime) onChange;
  final bool enabled;
  final bool required;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return CustomTextField(
        controller: TextEditingController(
            text: initialTime != null && initialTime!.split(':').length > 1
                ? Utils.dateToString(
                    'HH:mm',
                    DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        int.tryParse(initialTime!.split(':')[0]) ??
                            DateTime.now().hour,
                        int.tryParse(initialTime!.split(':')[1]) ??
                            DateTime.now().minute))
                : ''),
        title: title,
        readOnly: true,
        required: required,
        enabled: false,
        suffixIcon: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: '#082819'.color, width: 1.5))),
            child: SvgPicture.asset('calendar'.svg)
                .marginSymmetric(horizontal: 6, vertical: 3)),
      );
    }
    return CustomPopup(
        content: SizedBox(
          height: 200,
          width: 150,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            initialDateTime:
                initialTime != null && initialTime!.split(':').length > 1
                    ? DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        int.tryParse(initialTime?.split(':')[0] ?? '') ??
                            DateTime.now().hour,
                        int.tryParse(initialTime?.split(':')[1] ?? '') ??
                            DateTime.now().minute)
                    : null,
            onDateTimeChanged: onChange,
          ),
        ),
        child: CustomTextField(
          controller: TextEditingController(
              text: initialTime != null && initialTime!.split(':').length > 1
                  ? Utils.dateToString(
                      'HH:mm',
                      DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          int.tryParse(initialTime!.split(':')[0]) ??
                              DateTime.now().hour,
                          int.tryParse(initialTime!.split(':')[1]) ??
                              DateTime.now().minute))
                  : ''),
          title: title,
          isPickDate: true,
          enabled: false,
          hintText: 'Chọn ${title.toLowerCase()}',
          validator: (value) {
            if ((value == null || value.isEmpty) && required) {
              return 'Vui lòng nhập ${title.toLowerCase()}';
            }
            return null;
          },
          autovalidateMode: initialTime != null
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          required: required,
          suffixIcon: Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: '#082819'.color, width: 1.5))),
              child: SvgPicture.asset('calendar'.svg)
                  .marginSymmetric(horizontal: 6, vertical: 3)),
        ));
  }
}

class DateTimeTextField extends StatelessWidget {
  const DateTimeTextField(
      {super.key,
      this.date,
      required this.title,
      this.onChange,
      this.enabled = true,
      this.required = true,
      this.isContainTime = true,
      this.dateFormat = 'HH:mm dd-MM-yyyy'});
  final String title;
  final DateTime? date;
  final String dateFormat;
  final bool isContainTime;
  final Function(DateTime? value)? onChange;
  final bool enabled;
  final bool required;
  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return CustomTextField(
        controller:
            TextEditingController(text: Utils.dateToString(dateFormat, date)),
        title: title,
        readOnly: true,
        required: required,
        enabled: false,
        suffixIcon: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: '#082819'.color, width: 1.5))),
            child: SvgPicture.asset('calendar'.svg)
                .marginSymmetric(horizontal: 6, vertical: 3)),
      );
    }
    return CustomPopup(
      content: CalendarDatetimePicker(
          onChange: onChange, selectData: date, isContainTime: isContainTime),
      contentPadding: EdgeInsets.zero,
      child: CustomTextField(
        controller:
            TextEditingController(text: Utils.dateToString(dateFormat, date)),
        title: title,
        hintText: 'Chọn ${title.toLowerCase()}',
        readOnly: true,
        required: required,
        enabled: false,
        isPickDate: true,
        autovalidateMode: date != null
            ? AutovalidateMode.always
            : AutovalidateMode.onUserInteraction,
        validator: (value) {
          if ((value == null || value.isEmpty) && required) {
            return 'Vui lòng chọn ${title.toLowerCase()}';
          }
          return null;
        },
        suffixIcon: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: '#082819'.color, width: 1.5))),
            child: SvgPicture.asset('calendar'.svg)
                .marginSymmetric(horizontal: 6, vertical: 3)),
      ),
    );
  }
}

class CustomDropDownMultiSelect<T> extends StatelessWidget {
  const CustomDropDownMultiSelect({
    super.key,
    this.date,
    this.required = false,
    required this.title,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.enabled = true,
    this.hint,
    required this.selectedValues,
    required this.options,
    required this.onChanged,
    this.multiSelect = true,
    required this.listItemBuilder,
    required this.headerListBuilder,
    this.maxLines = 1,
  });
  final String title;
  final String? hint;
  final List<T> selectedValues;
  final List<T> options;
  final DateTime? date;
  final bool required;
  final int maxLines;
  final dynamic Function(List<T>) onChanged;
  final BorderRadius borderRadius;
  final bool enabled;
  final bool multiSelect;
  final Widget Function(BuildContext context, T item, bool isSelected,
      void Function() onItemSelect) listItemBuilder;
  final Widget Function(
          BuildContext context, List<T> selectedItems, bool enabled)
      headerListBuilder;
  @override
  Widget build(BuildContext context) {
    final decoration = CustomDropdownDecoration(
        closedSuffixIcon: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: '#082819'.color, width: 1.5))),
            child: const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
            )),
        expandedSuffixIcon: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: '#082819'.color, width: 1.5))),
            child: const Icon(
              Icons.keyboard_arrow_up_outlined,
              size: 20,
            )),
        closedBorder: Border.all(color: Theme.of(context).colorScheme.outline),
        closedBorderRadius: borderRadius,
        closedErrorBorder:
            Border.all(color: Theme.of(context).colorScheme.error),
        closedErrorBorderRadius: borderRadius,
        expandedBorder:
            Border.all(color: Theme.of(context).colorScheme.outline),
        expandedBorderRadius: borderRadius,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14, fontWeight: FontWeight.w700, color: '#BABABA'.color));
    if (multiSelect) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            if (required)
              title.requiredText(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary)
            else
              title.size14.w700.color(Theme.of(context).colorScheme.primary),
          if (title.isNotEmpty) 8.sized,
          Material(
            borderRadius: borderRadius,
            color: enabled ? Colors.white : '#EBEAEA'.color,
            child: CustomDropdown<T>.multiSelectSearch(
              initialItems: selectedValues,
              items: options,
              maxlines: maxLines,
              onListChanged: onChanged,
              hintText: hint ?? 'Chọn ${title.toLowerCase()}',
              disabledDecoration: CustomDropdownDisabledDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: borderRadius,
              ),
              closedHeaderPadding:
                  const EdgeInsets.only(top: 12, bottom: 12, left: 12),
              expandedHeaderPadding:
                  const EdgeInsets.only(top: 12, bottom: 12, left: 12),
              decoration: decoration,
              searchHintText: 'Tìm kiếm',
              listItemBuilder: listItemBuilder,
              headerListBuilder: headerListBuilder,
              enabled: enabled,
              noResultFoundBuilder: (context, text) => const EmptyWidget(),
              listValidator: (value) => value.isEmpty && required
                  ? 'Vui lòng chọn ${title.toLowerCase()}'
                  : null,
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          if (required)
            title.requiredText(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary)
          else
            title.size14.w700.color(Theme.of(context).colorScheme.primary),
        if (title.isNotEmpty) 8.sized,
        Material(
          borderRadius: borderRadius,
          color: enabled ? Colors.white : '#EBEAEA'.color,
          child: CustomDropdown<T>.search(
            initialItem: selectedValues.firstOrNull,
            items: options,
            maxlines: maxLines,
            onChanged: (value) =>
                value != null ? onChanged.call([value]) : null,
            hintText: hint ?? 'Chọn ${title.toLowerCase()}',
            decoration: decoration,
            closedHeaderPadding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 12),
            expandedHeaderPadding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 12),
            searchHintText: 'Tìm kiếm',
            listItemBuilder: listItemBuilder,
            disabledDecoration: CustomDropdownDisabledDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              borderRadius: borderRadius,
            ),
            headerBuilder: (context, selectedItem, enabled) =>
                headerListBuilder(context, [selectedItem], enabled),
            enabled: enabled,
            noResultFoundBuilder: (context, text) => const EmptyWidget(),
            validator: (value) => value == null && required
                ? 'Vui lòng chọn ${title.toLowerCase()}'
                : null,
          ),
        ),
      ],
    );
  }
}

class CustomDropDownMultiSelectRequest<T> extends StatelessWidget {
  const CustomDropDownMultiSelectRequest({
    super.key,
    this.date,
    this.required = false,
    required this.title,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.enabled = true,
    this.hint,
    required this.selectedValues,
    required this.options,
    required this.onChanged,
    this.multiSelect = true,
    required this.listItemBuilder,
    required this.headerListBuilder,
    this.maxLines = 1,
    required this.futureRequest,
  });
  final String title;
  final String? hint;
  final List<T> selectedValues;
  final List<T> options;
  final DateTime? date;
  final bool required;
  final int maxLines;
  final dynamic Function(List<T>) onChanged;
  final BorderRadius borderRadius;
  final bool enabled;
  final bool multiSelect;
  final Widget Function(BuildContext context, T item, bool isSelected,
      void Function() onItemSelect) listItemBuilder;
  final Widget Function(
          BuildContext context, List<T> selectedItems, bool enabled)
      headerListBuilder;
  final Future<List<T>> Function(String query)? futureRequest;
  @override
  Widget build(BuildContext context) {
    final decoration = CustomDropdownDecoration(
        closedBorder: Border.all(color: Theme.of(context).colorScheme.outline),
        closedBorderRadius: borderRadius,
        closedSuffixIcon: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: '#082819'.color, width: 1.5))),
            child: const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
            )),
        expandedSuffixIcon: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: '#082819'.color, width: 1.5))),
            child: const Icon(
              Icons.keyboard_arrow_up_outlined,
              size: 20,
            )),
        closedErrorBorder:
            Border.all(color: Theme.of(context).colorScheme.error),
        closedErrorBorderRadius: borderRadius,
        expandedBorder:
            Border.all(color: Theme.of(context).colorScheme.outline),
        expandedBorderRadius: borderRadius,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14, fontWeight: FontWeight.w700, color: '#BABABA'.color));
    if (multiSelect) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            if (required)
              title.requiredText(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary)
            else
              title.size14.w700.color(Theme.of(context).colorScheme.primary),
          if (title.isNotEmpty) 8.sized,
          Material(
            borderRadius: borderRadius,
            color: enabled ? Colors.white : '#EBEAEA'.color,
            child: CustomDropdown<T>.multiSelectSearchRequest(
              futureRequest: futureRequest,
              initialItems: selectedValues,
              items: options,
              maxlines: maxLines,
              closeDropDownOnClearFilterSearch: true,
              onListChanged: onChanged,
              hintText: hint ?? 'Chọn ${title.toLowerCase()}',
              disabledDecoration: CustomDropdownDisabledDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: borderRadius,
              ),
              closedHeaderPadding:
                  const EdgeInsets.only(top: 12, bottom: 12, left: 12),
              expandedHeaderPadding:
                  const EdgeInsets.only(top: 12, bottom: 12, left: 12),
              decoration: decoration,
              searchHintText: 'Tìm kiếm',
              listItemBuilder: listItemBuilder,
              headerListBuilder: headerListBuilder,
              enabled: enabled,
              noResultFoundBuilder: (context, text) => const EmptyWidget(),
              listValidator: (value) => value.isEmpty && required
                  ? 'Vui lòng chọn ${title.toLowerCase()}'
                  : null,
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          if (required)
            title.requiredText(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary)
          else
            title.size14.w700.color(Theme.of(context).colorScheme.primary),
        if (title.isNotEmpty) 8.sized,
        Material(
          borderRadius: borderRadius,
          color: enabled ? Colors.white : '#EBEAEA'.color,
          child: CustomDropdown<T>.searchRequest(
            futureRequest: futureRequest,
            initialItem: selectedValues.firstOrNull,
            items: options,
            maxlines: maxLines,
            onChanged: (value) =>
                value != null ? onChanged.call([value]) : null,
            hintText: hint ?? 'Chọn ${title.toLowerCase()}',
            decoration: decoration,
            closedHeaderPadding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 12),
            expandedHeaderPadding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 12),
            searchHintText: 'Tìm kiếm',
            closeDropDownOnClearFilterSearch: true,
            listItemBuilder: listItemBuilder,
            disabledDecoration: CustomDropdownDisabledDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              borderRadius: borderRadius,
            ),
            headerBuilder: (context, selectedItem, enabled) =>
                headerListBuilder(context, [selectedItem], enabled),
            enabled: enabled,
            noResultFoundBuilder: (context, text) => const EmptyWidget(),
            validator: (value) => value == null && required
                ? 'Vui lòng chọn ${title.toLowerCase()}'
                : null,
          ),
        ),
      ],
    );
  }
}

class CustomInputQty extends StatelessWidget {
  const CustomInputQty({
    super.key,
    this.required = false,
    this.onChanged,
    this.textAlign,
    this.contentAlignment = TextAlign.start,
    this.validator,
    this.initialValue,
    this.title,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.maxVal,
    this.minVal,
    this.enabled = true,
  });
  final String? title;
  final bool required;
  final void Function(dynamic value)? onChanged;
  final TextAlign? textAlign;
  final TextAlign contentAlignment;
  final String? Function(num? value)? validator;
  final num? initialValue;
  final BorderRadius borderRadius;
  final num? maxVal;
  final num? minVal;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return CustomTextField(
        controller: TextEditingController(text: initialValue?.toString()),
        title: title,
        enabled: false,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          if (required)
            title!.requiredText(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary)
          else
            title!.size14.w700.color(Theme.of(context).colorScheme.primary),
        if (title != null) 8.sized,
        InputQty(
          initVal: initialValue ?? 0,
          validator: validator,
          onQtyChanged: onChanged,
          maxVal: maxVal ?? double.maxFinite,
          minVal: minVal ?? 0,
          qtyFormProps: QtyFormProps(
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                  color: '#082819'.color)),
          decoration: QtyDecorationProps(
            minusButtonConstrains: const BoxConstraints(
              minWidth: 10,
            ),
            plusButtonConstrains: const BoxConstraints(
              minWidth: 10,
            ),
            qtyStyle: QtyStyle.btnOnRight,
            orientation: ButtonOrientation.vertical,
            btnColor: Theme.of(context).colorScheme.primary,
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
            contentPadding: const EdgeInsets.all(16),
            constraints: BoxConstraints(minWidth: ScreenUtil().screenWidth),
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}

Widget defaultListItemBuilder(
  String result,
  bool isSelected,
  bool multipleSelect,
  VoidCallback onItemSelect,
) {
  return Row(
    children: [
      Expanded(
        child: result.size14,
      ),
      if (multipleSelect)
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12.0),
          child: Checkbox(
            onChanged: (_) => onItemSelect(),
            value: isSelected,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          ),
        ),
    ],
  );
}

Widget defaultHeaderBuilder(String result) {
  return result.size14.w600.ellipsis;
}
