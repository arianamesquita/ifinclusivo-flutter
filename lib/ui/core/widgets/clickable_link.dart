import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum LinkType { email, url, phone, whatsapp }

class ClickableLink extends StatelessWidget {
  final String label;
  final String value;
  final LinkType type;
  final TextStyle? style;

  const ClickableLink({
    super.key,
    required this.label,
    required this.value,
    this.type = LinkType.url,
    this.style,
  });

  Uri get _uri {
    switch (type) {
      case LinkType.email:
        return Uri(scheme: 'mailto', path: value);
      case LinkType.phone:
        return Uri(scheme: 'tel', path: value);
      case LinkType.whatsapp:
        return Uri.parse('https://wa.me/$value');
      case LinkType.url:
      return Uri.parse(value);
    }
  }

  Future<void> _launch() async {
    if (kIsWeb) {
      // Web: apenas lança direto
      await launchUrl(_uri, mode: LaunchMode.platformDefault);
    } else {
      // Mobile/Desktop: verifica antes
      if (await canLaunchUrl(_uri)) {
        await launchUrl(_uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Não foi possível abrir o link: $value';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = style ??
        TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        );

    return InkWell(
      onTap: _launch,
      child: Text(label, style: defaultStyle, softWrap: true,),
    );
  }
}
