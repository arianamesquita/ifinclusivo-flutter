import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String title;
  final String value;
  final String placeholder;
  final bool isError;
  final String errorText;
  final FormFieldValidator<String>? validator;
  final Function(String) onValueChange;
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;

  const PasswordTextField({
    required this.onValueChange, Key? key,
    this.title = '',
    this.value = '',
    this.placeholder = '',
    this.isError = false,
    this.errorText = '',
    this.validator,
    this.autofillHints,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() =>
      _PasswordTextFieldState();
}

class _PasswordTextFieldState
    extends State<PasswordTextField> {
  late TextEditingController _controller;
  bool passwordVisible = false;


  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }
  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(252, 249, 248, 1),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  offset: const Offset(0,3)
                )
              ]
            ),
          child: TextFormField(
            onFieldSubmitted: widget.onFieldSubmitted,
            focusNode: widget.focusNode,
            obscureText: !passwordVisible,
            validator: widget.validator,
            autofillHints: widget.autofillHints,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (String value) {
              widget.onValueChange(value);
              if (widget.validator != null) {
                setState(() {
                });
              }
            },
            decoration: InputDecoration(
              hintText: widget.placeholder,
              filled: true,
              fillColor: Color.fromRGBO(252, 249, 248, 1),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
