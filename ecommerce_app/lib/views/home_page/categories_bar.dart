import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({super.key});

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                color: const Color.fromARGB(255, 224, 84, 75),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Danh mục',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Danh mục',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Danh mục',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Danh mục',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Danh mục',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Danh mục',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Danh mục',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Danh mục',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    ],
                  ),
                ),
              );
  }
}