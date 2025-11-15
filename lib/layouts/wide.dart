import 'package:flutter/material.dart';

class WideLayout extends StatelessWidget {
  const WideLayout({
    super.key,
    required this.body,
    required this.sidebar,
    this.compressed = false,
  });

  final Widget body;
  final Widget sidebar;
  final bool compressed;

  @override
  Widget build(BuildContext context) {
    Widget _body = body;
    if (!compressed) _body = Expanded(child: _body);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 350, child: sidebar),
        _body,
      ],
    );
  }
}
