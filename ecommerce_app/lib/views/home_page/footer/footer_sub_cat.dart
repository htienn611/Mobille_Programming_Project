import 'package:flutter/material.dart';

class FooterSubCat extends StatefulWidget {
  const FooterSubCat({super.key});

  @override
  State<FooterSubCat> createState() => _FooterSubCatState();
}

class _FooterSubCatState extends State<FooterSubCat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Text('Sub cat'),
    );
  }
}
