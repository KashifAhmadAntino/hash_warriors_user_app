import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_voting_app/core/constants/app_colors.dart';
import 'package:user_voting_app/core/constants/app_text_style.dart';
import 'package:user_voting_app/core/constants/image_path.dart';
import 'package:user_voting_app/core/image_loader.dart';
import 'package:user_voting_app/core/reponsive/SizeConfig.dart';

//todo kashif work on the documentation of this file
class CustomTextFieldWithLabel extends StatefulWidget {
  final String? title;
  final String? helperText;

  final String? prefixText;

  ///use this to secure the textfield
  final bool isSecure;

  ///this will hold max length for characters in textfield
  final int maxLength;

  ///hint text will show hint for the text
  final String? hint;

  ///use this top changw inputType and keyboard type
  final TextInputType? inputType;

  ///use this variable to give some initial text to textField
  final String? initValue;

  ///this variable holds the suffix icon widget
  final Widget? suffix;

  ///use this variable to provide prefix svg icon path
  ///Note:- always use SVG here
  final String? prefixIconPath;

  ///Text editing controller
  final TextEditingController controller;

  ///validator
  final String? Function(String? value)? validator;

  ///this will get triggered when text field is changed
  final Function(String)? onChanged;

  ///this method will be called when input is completed
  final Function(String)? onSaved;

  ///this will hold all the text input formatters
  final List<TextInputFormatter>? inputFormatters;

  ///this will hold max line
  final int? maxLines;

  ///this will enable and disable textformfield
  final bool? isEnabled;

  ///Use this variable to change the scale of suffix icon if the icon is small we can also decrease the scale
  ///EX:- 1.2 will increase the scale of icon by 20%
  final double? suffixIconScale;

  ///this variable will hold input info like EX:- mobile number should be 10 digit
  final String? inputInformation;

  static const int MAX_LENGTH = 500;

  ///Default value = TextCapitalization.none
  final TextCapitalization? textCapitalization;

  ///Use this variable to and provide string and this with match the keyboard according to string
  final String? dynamicKeyboardText;

  ///use this variable to enable copy icon
  final bool? wantCopyIcon;

  final VoidCallback? onCopyTapped;

  final bool? readOnly;

  final bool? disableBorder;

  final TextInputAction? textInputAction;
  const CustomTextFieldWithLabel({
    Key? key,
    this.title,
    this.disableBorder,
    this.wantCopyIcon,
    this.readOnly,
    this.onCopyTapped,
    this.textInputAction,
    this.dynamicKeyboardText,
    this.textCapitalization,
    this.inputInformation,
    this.hint,
    this.helperText,
    this.prefixText,
    this.inputType,
    this.initValue = "",
    this.isSecure = false,
    required this.controller,
    this.validator,
    this.maxLength = MAX_LENGTH,
    this.onChanged,
    this.onSaved,
    this.inputFormatters,
    this.suffix,
    this.prefixIconPath,
    this.maxLines,
    this.suffixIconScale = 1,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  _CustomTextFieldWithLabelState createState() =>
      _CustomTextFieldWithLabelState();
}

class _CustomTextFieldWithLabelState extends State<CustomTextFieldWithLabel> {
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNodeKeyboard = FocusNode();

  double borderSize = 1;
  Color normalColor = AppColors.neutral08;
  Color errorColor = AppColors.redError;
  Color normalLabelColor = Colors.cyan;

  TextStyle labelStyle = AppTextStyle.f14w500InterNetural08;

  Color labelColor = AppColors.neutral08;
  BoxBorder? border = Border.all(color: AppColors.neutral06);
  Color mainColor = AppColors.neutral08;
  bool fieldHasFocus = false;
  bool inputHasError = false;
  String? errorText;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool removeValidation = false;
  TextCapitalization? textCapitalization;
  TextInputType? inputType;
  @override
  void initState() {
    super.initState();
    inputType = widget.inputType;
    textCapitalization = widget.textCapitalization;
    widget.controller.text = widget.initValue ?? "";

    _focusNode.addListener(() {
      checkFieldState();
      if (_focusNode.hasFocus == false && widget.validator != null) {
        formKey.currentState?.validate();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: _focusNode.hasFocus ||
              widget.controller.text.trim().isNotEmpty == true,
          maintainAnimation: true,
          maintainState: true,
          child: Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 6 * SizeConfig.heightMultiplier!),
                child: Text(
                  widget.title ?? '',
                  style: AppTextStyle.f14w500InterNeutral06.copyWith(height: 1),
                ),
              ),
            ],
          ),
        ),
        Focus(
          focusNode: _focusNode,
          child: Form(
            key: formKey,
            child: TextFormField(
              readOnly: widget.readOnly ?? false,
              onFieldSubmitted: (va) {
                if (widget.textInputAction != TextInputAction.done) {
                  FocusScope.of(context).nextFocus();
                }
              },
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              enabled: widget.isEnabled,
              controller: widget.controller,
              focusNode: _focusNodeKeyboard,
              autocorrect: false,
              obscureText: widget.isSecure,
              keyboardType: inputType,
              validator: (value) {
                if (removeValidation == true) {
                  removeValidation = false;
                  return null;
                }
                errorText = widget.validator?.call(value);
                inputHasError = errorText != null ? true : false;
                checkFieldState();
                return (errorText == null || errorText?.isEmpty == true)
                    ? null
                    : '';
              },
              cursorColor: AppColors.teal,
              style: AppTextStyle.f16w500InterBlackShade2,
              maxLength: widget.maxLength,
              inputFormatters: widget.inputFormatters,
              maxLines: widget.maxLines ?? 1,
              onChanged: (text) {
                widget.onChanged?.call(text);
                if (errorText != null && errorText?.isNotEmpty == true) {
                  removeValidation = true;
                  formKey.currentState?.validate();
                }

                inputHasError = false;
                errorText = null;
                checkFieldState();
                TextInputType? tempInputType = inputType;
                if (widget.dynamicKeyboardText != null &&
                    widget.dynamicKeyboardText?.isNotEmpty == true) {
                  try {
                    if (int.tryParse(widget.dynamicKeyboardText?[
                                widget.controller.text.length] ??
                            '') !=
                        null) {
                      tempInputType = TextInputType.number;
                    } else {
                      if (RegExp(r'[A-Z]').hasMatch(widget.dynamicKeyboardText?[
                              widget.controller.text.length] ??
                          '')) {
                        ///this will open capital texted keyboard
                        textCapitalization = TextCapitalization.characters;
                      } else {
                        ///this will open small texted keyboard
                        textCapitalization = TextCapitalization.none;
                      }
                      tempInputType = TextInputType.text;
                    }
                  } catch (e) {
                    tempInputType = TextInputType.text;
                    textCapitalization = TextCapitalization.none;
                  }
                  if (inputType != tempInputType) {
                    inputType = tempInputType;
                    setState(() {
                      setState(() {
                        _focusNodeKeyboard.unfocus();
                        Future.delayed(const Duration(milliseconds: 50))
                            .then((value) {
                          _focusNodeKeyboard.canRequestFocus;
                          _focusNodeKeyboard.requestFocus();
                        });
                      });
                    });
                  }
                }
              },
              decoration: InputDecoration(
                  suffixIconConstraints: BoxConstraints(
                      minHeight: 24 * SizeConfig.heightMultiplier!,
                      minWidth: 24 * SizeConfig.widthMultiplier!),
                  errorStyle: const TextStyle(height: 0),
                  filled: (widget.isEnabled == false || widget.readOnly == true)
                      ? true
                      : false,

                  ///remove the comment to make field grey when empty
                  // : ((_focusNode.hasFocus == true ||
                  //         widget.controller.text.isNotEmpty)
                  //     ? false
                  //     : true),

                  prefix: ((widget.prefixIconPath != null &&
                              _focusNode.hasFocus) ||
                          (widget.prefixIconPath != null &&
                              widget.controller.text.isNotEmpty == true))
                      ? Transform.scale(
                          scale: 1.6,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 2 * SizeConfig.widthMultiplier!,
                                right: 6 * SizeConfig.widthMultiplier!),
                            child: ImageLoader.assetSvg(
                                widget.prefixIconPath ?? '',
                                color: AppColors.chineseBlack.withOpacity(0.3),
                                width: 12,
                                height: 12),
                          ),
                        )
                      : null,
                  fillColor:
                      (widget.isEnabled == false || widget.readOnly == true)
                          ? AppColors.baseBg
                          : AppColors.neutral01,
                  counterText: "",
                  floatingLabelStyle: labelStyle,
                  label: _focusNode.hasFocus ||
                          widget.controller.text.trim().isNotEmpty == true
                      ? null
                      : Row(
                          children: [
                            if (widget.prefixIconPath != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Center(
                                  child: ImageLoader.assetSvg(
                                    widget.prefixIconPath ?? '',
                                    color:
                                        AppColors.chineseBlack.withOpacity(0.3),
                                    width: 18,
                                  ),
                                ),
                              ),
                            Text(
                              widget.title ?? '',
                              style: AppTextStyle.f14w500InterNeutral06,
                            ),
                          ],
                        ),
                  hintText: widget.hint,
                  hintStyle: AppTextStyle.f16w500InterBlackShade2
                      .copyWith(color: Colors.grey.withOpacity(0.5)),
                  helperText: widget.helperText,
                  prefixText: widget.prefixText,
                  suffixIcon: widget.wantCopyIcon == true
                      ? GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: widget.controller.text));
                            widget.onCopyTapped?.call();
                          },
                          child: Container(
                            color: AppColors.transparent,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 16 * SizeConfig.widthMultiplier!),
                              child: ImageLoader.assetSvg('',
                                  width: 18, height: 18),
                            ),
                          ),
                        )
                      : widget.suffix,
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 16 * SizeConfig.heightMultiplier!,
                      horizontal: 16 * SizeConfig.widthMultiplier!),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.disableBorder == true
                            ? AppColors.transparent
                            : AppColors.blackShade2,
                        width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.disableBorder == true
                            ? AppColors.transparent
                            : AppColors.chineseBlack.withOpacity(0.53),
                        width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: widget.disableBorder == true
                            ? AppColors.transparent
                            : AppColors.redError),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.disableBorder == true
                            ? AppColors.transparent
                            : AppColors.neutral02,
                        width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: widget.disableBorder == true
                            ? AppColors.transparent
                            : AppColors.redError),
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
        ),
        if ((errorText != null && errorText?.isNotEmpty == true) &&
            _focusNode.hasFocus == true)
          Padding(
            padding: EdgeInsets.only(top: 6 * SizeConfig.heightMultiplier!),
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  size: 20,
                ),
                SizedBox(
                  width: 6 * SizeConfig.widthMultiplier!,
                ),
                Text(
                  errorText ?? 'Email ID is not Valid',
                  style: AppTextStyle.f14w500InterRed,
                )
              ],
            ),
          ),
        if ((errorText?.isEmpty == true || errorText == null) &&
            (widget.inputInformation != null &&
                widget.inputInformation?.isNotEmpty == true) &&
            _focusNode.hasFocus == true)
          Padding(
            padding: EdgeInsets.only(top: 6 * SizeConfig.heightMultiplier!),
            child: Text(
              widget.inputInformation ?? '',
              style: AppTextStyle.f14w500InterNeutral06
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void checkFieldState() {
    if (inputHasError == true) {
      mainColor = errorColor;
      border = Border.all(color: errorColor);
      labelColor = errorColor;
      setState(() {});
    } else if ((_focusNode.hasFocus && inputHasError == false) ||
        (widget.controller.text.isNotEmpty == true && inputHasError == false)) {
      mainColor = normalColor;
      border = Border.all(color: mainColor);
      labelColor = mainColor;
      setState(() {});
    } else {
      border = Border.all(color: AppColors.neutral06);
      labelColor = AppColors.neutral06;
      setState(() {});
    }
  }
}
