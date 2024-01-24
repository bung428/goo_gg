import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goo_gg_application/widget/touch_well.dart';

typedef SearchCallback = void Function(String value);

class SearchWidget extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final SearchCallback? searchCallback;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const SearchWidget({
    super.key,
    this.hintText,
    this.labelText,
    this.searchCallback,
    this.textInputType,
    this.textInputAction,
    this.inputFormatters
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final textController = TextEditingController();

  bool btnEnable = false;

  @override
  void initState() {
    if (kDebugMode) {
      textController.text = '석춧가루';
      setState(() {
        btnEnable = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 66,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textController,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                label: widget.labelText != null ? Text(
                  widget.labelText!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor.withOpacity(0.7)
                  ),
                ) : const SizedBox(),
                hintText: widget.hintText,
                border: OutlineInputBorder(
                  gapPadding: 10,
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                    width: 1.5
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                    width: 1.5
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: _onChangedSearchText,
            ),
          ),
          const SizedBox(width: 12,),
          TouchWell(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: btnEnable ? () {
              if (widget.searchCallback != null) {
                widget.searchCallback!(textController.text);
              }
            } : null,
            child: Container(
              width: 66,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Text(
                  '검색',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.scaffoldBackgroundColor
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }

  void _onChangedSearchText(String value) {
    setState(() {
      value.isEmpty ? btnEnable = false : btnEnable = true;
    });
  }
}
