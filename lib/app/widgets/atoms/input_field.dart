import 'package:flutter/material.dart'
    show
        AutovalidateMode,
        BuildContext,
        FormFieldValidator,
        Icon,
        IconButton,
        Icons,
        InputDecoration,
        State,
        StatefulWidget,
        Widget;
import 'package:flutter_form_builder/flutter_form_builder.dart'
    show FormBuilderTextField;

class InputField extends StatefulWidget {
  final Widget? label;
  final String? hintText;
  final String name;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autovalidateMode;
  final bool obscureText;
  const InputField(
      {super.key,
      this.label,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.hintText,
      this.validator,
      required this.name,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _secureText = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      autovalidateMode: widget.autovalidateMode,
      validator: widget.validator,
      obscureText: widget.obscureText ? (_secureText ? false : true) : false,
      decoration: InputDecoration(
          label: widget.label,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _secureText = !_secureText;
                    });
                  },
                  icon: Icon(
                      _secureText ? Icons.visibility : Icons.visibility_off))
              : widget.suffixIcon),
    );
  }
}
