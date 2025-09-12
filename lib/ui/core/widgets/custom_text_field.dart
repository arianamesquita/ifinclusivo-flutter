import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String placeholderText;
  final String? initialValue;
  final Function(String) onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  const CustomTextField({
    required this.labelText,
    required this.placeholderText,
    required this.onChanged,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.keyboardType,
    this.inputFormatters,
    this.autofillHints,
    Key? key,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
            decoration: InputDecoration(
              hintText: widget.placeholderText,
              filled: true,
              fillColor: Color.fromRGBO(252, 249, 248, 1),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
            initialValue: widget.initialValue,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            validator: widget.validator,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofillHints: widget.autofillHints,
          ),
        ),
      ],
    );
  }
}
